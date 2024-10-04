export const getProjects = async (
  projectIds: FormAnswerValue,
  dbClient: PgClient,
): Promise<Array<ProjectRegistryRow>> => {
  const { valuesForSql, args } = getValuesAndArguments(projectIds);

  if (valuesForSql.length === 0) {
    return [];
  }

  const projects = await dbClient.query({
    text: `
          SELECT
            PROJECTS.NAME,
              REGISTRIES.NAME AS REGISTRY_NAME,
              PROJECTS_REGISTRIES.REGISTRY_PROJECT_ID
          FROM
              LIVE.${LIVE_TABLE_VERSIONS.projects} AS PROJECTS
            LEFT JOIN LIVE.${LIVE_TABLE_VERSIONS.projects_registries} AS PROJECTS_REGISTRIES 
            ON PROJECTS.PROJECT_REGISTRY_ID = PROJECTS_REGISTRIES.ID
            LEFT JOIN LIVE.${LIVE_TABLE_VERSIONS.registries} AS REGISTRIES 
            ON PROJECTS_REGISTRIES.REGISTRY_ID = REGISTRIES.ID
          WHERE
              PROJECTS.ID IN (${args})
        `,
    values: valuesForSql,
  });

  if (projects.rows.length !== valuesForSql.length) {
    throw new NotFoundError(
      'projects',
      `The projects with id(s) ${valuesForSql.toString()} could not be found`,
    );
  }

  return projects.rows as Array<ProjectRegistryRow>;
};

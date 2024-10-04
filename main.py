from typing import Any

from sqlalchemy.engine.row import Row
from sqlalchemy.orm import Session
from sqlalchemy.sql.expression import Executable, Label


def _paginate_by_id(
    executable: Executable, id_value: str, id_column: Label, page_size: int, db: Session
) -> tuple[Row, dict[str, Any]]:
    """Paginate by id column.

    Args:
        executable:
            The statement to paginate.
        id_value:
            Value of the minimum id of the page.
        id_column:
            A label object representing the id column to order by. This must be included in the query.
        page_size:
            How many rows in the page.
        db:
            The database session.
    Returns:
        The data and then the maximum id value in a dict.
    """
    if id_column.name not in [col["name"] for col in executable.column_descriptions]:
        raise ValueError(
            f"Chosen column `{id_column.name}` should be selected by the executable."
        )
    executable = executable.order_by(id_column)
    if id_value:
        executable = executable.filter(id_column > id_value)
    out = db.execute(executable.limit(page_size)).all()
    if len(out) < page_size:
        return out, {"id": None}

    return out, {"id": out[-1]._mapping[id_column.name]}

import os

import ehrql.tables.nationalsde
import ehrql.tables.smoketest

from ..query_engines.spark import SparkQueryEngine
from .base import MappedTable, SQLBackend


SCHEMA = os.environ.get("GRAPHNET_DB_SCHEMA", default="TRE")


class NationalSDEBackend(SQLBackend):
    """Backend for working with data in NationalSDE."""

    display_name = "NationalSDE"
    query_engine_class = SparkQueryEngine
    patient_join_column = "Patient_ID"
    implements = [ehrql.tables.smoketest]

    patients = MappedTable(
        schema=SCHEMA,
        source="Patients",
        columns=dict(
            date_of_birth="DateOfBirth",
        ),
    )

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
    patient_join_column = "patient_id"
    implements = [ehrql.tables.smoketest]

    # TODO: not sure this table is available, but we're not using it rn
    patients = MappedTable(
        schema=SCHEMA,
        source="Patients",
        columns=dict(
            patient_id="person_id",
            date_of_birth="DateOfBirth",
        ),
    )

    hes_apc_columns = dict(
        patient_id="person_id",
        fde="fde",
        diag_4_01="diag_4_01",
        diag_4_02="diag_4_02",
        diag_4_03="diag_4_03",
        admimeth="admimeth",
        procodet="procodet",
        sitetret="sitetret",
        disdate="disdate",
        classpat="classpat",
        startage_calc="startage_calc",
    )

    artificial_hes_apc_2425 = MappedTable(
        source="artificial_hes_apc_2425",
        columns=hes_apc_columns,
    )

    artificial_hes_apc_2223 = MappedTable(
        source="artificial_hes_apc_2223",
        columns=hes_apc_columns,
    )

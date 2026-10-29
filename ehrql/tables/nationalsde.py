import datetime

from ehrql.codes import ICD10Code
from ehrql.query_language import EventFrame
from ehrql.tables import Series, table
from ehrql.tables.core import (
    clinical_events,
    # covid_test_results,
    # hospitalisations_without_system,
    # patient_address,
    patients,
    practice_registrations,
)


__all__ = [
    "artificial_hes_apc_2425",
    "clinical_events",
    # "covid_test_results",
    # "hospitalisations_without_system",
    # "patient_address",
    "patients",
    "practice_registrations",
]


@table
class artificial_hes_apc_2425(EventFrame):
    fde = Series(int)
    diag_4_01 = Series(
        ICD10Code,
    )
    diag_4_02 = Series(
        ICD10Code,
    )
    diag_4_03 = Series(
        ICD10Code,
    )
    admimeth = Series(str)
    procodet = Series(str)
    sitetret = Series(str)
    disdate = Series(datetime.date)
    classpat = Series(str)
    startage_calc = Series(int)


@table
class artificial_hes_apc_2223(EventFrame):
    fde = Series(int)
    diag_4_01 = Series(
        ICD10Code,
    )
    diag_4_02 = Series(
        ICD10Code,
    )
    diag_4_03 = Series(
        ICD10Code,
    )
    admimeth = Series(str)
    procodet = Series(str)
    sitetret = Series(str)
    disdate = Series(datetime.date)
    classpat = Series(str)
    startage_calc = Series(int)

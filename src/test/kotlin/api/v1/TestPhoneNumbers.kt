package api.v1

val TEST_NUMBER_WITH_SCHEDULE: String? = System.getenv("TEST_NUMBER_WITH_SCHEDULE")
val TEST_NUMBER_WITH_SCHEDULE_TO_DELETE: String? = System.getenv("TEST_NUMBER_WITH_SCHEDULE_TO_DELETE")
val TEST_NUMBER_WITHOUT_SCHEDULE_NO_ADD: String? = System.getenv("TEST_NUMBER_WITHOUT_SCHEDULE_NO_ADD")
val TEST_NUMBER_WITHOUT_SCHEDULE: String? = System.getenv("TEST_NUMBER_WITHOUT_SCHEDULE")
val INVALID_PHONE_NUMBER: String? = System.getenv("INVALID_PHONE_NUMBER")

val TEST_PHONE_NUMBERS = listOf(
        TEST_NUMBER_WITH_SCHEDULE,
        TEST_NUMBER_WITH_SCHEDULE_TO_DELETE,
        TEST_NUMBER_WITHOUT_SCHEDULE_NO_ADD,
        TEST_NUMBER_WITHOUT_SCHEDULE,
        INVALID_PHONE_NUMBER
)
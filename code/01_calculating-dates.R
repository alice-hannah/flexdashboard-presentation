# 1: The 'manual' way ----

# Number of Tuesdays in January 2018
sum(format(seq(lubridate::dmy(01012018), 
               lubridate::dmy(31012018), 
               by = "day"), "%w") == 2)

# Number of Wednesdays in first quarter of 2019
sum(format(seq(lubridate::dmy(01012019), 
               lubridate::dmy(31032019), 
               by = "day"), "%w") == 3)

# Number of Thursdays in 2020
sum(format(seq(lubridate::dmy(01012020), 
               lubridate::dmy(31122020), 
               by = "day"), "%w") == 4)



### 2: Use a function instead ----

# Source in n_day function
source(here::here("code", "02_n_day.R"))

# Number of Tuesdays in January 2018
n_day(lubridate::dmy(01012018), lubridate::dmy(31012018), 2)

# Number of Wednesdays in first quarter of 2019
n_day(lubridate::dmy(01012019), lubridate::dmy(31032019), 3)

# Number of Thursdays in 2020
n_day(lubridate::dmy(01012020), lubridate::dmy(31122020), 4)



### 3: Informal checks that the function behaves as expected ----

# Check that n_day errors if supplied with non-date start and ends
n_day("2018-01-01", "2018-01-31", 2)

# Check that n_day errors if not supplied with a valid n
n_day(lubridate::dmy(01012019), lubridate::dmy(31032019), "two")
n_day(lubridate::dmy(01012020), lubridate::dmy(31122020), 7)

# Check that n_day produces at least 52 instances of every day in 2020
unlist(purrr::map(0:6, ~ n_day(lubridate::dmy(01012020), 
                               lubridate::dmy(31122020), 
                               .x)))

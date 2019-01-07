Data cleaning
================
Jenny
3 בינואר 2019

## Introduction

This file documents the data cleaning for the Representation Project

## Data cleaning

Read in the data.

``` r
tbl<-read_rds("../Data/cumulative_2006_2017.Rds")
```

Take a look at the data

``` r
head(tbl)
```

    ## # A tibble: 6 x 70
    ##    year case_id weight weight_cumulati~ state st    cd     dist dist_up
    ##   <int>   <int>  <dbl>            <dbl> <chr> <chr> <S3:> <int>   <int>
    ## 1  2006  439219  1.85             1.35  Nort~ NC    NC-10    10      10
    ## 2  2006  439224  0.968            0.704 Ohio  OH    OH-3      3       3
    ## 3  2006  439228  1.59             1.16  New ~ NJ    NJ-1      1       1
    ## 4  2006  439237  1.40             1.02  Illi~ IL    IL-9      9       9
    ## 5  2006  439238  0.903            0.656 New ~ NY    NY-22    22      22
    ## 6  2006  439242  0.839            0.610 Texas TX    TX-11    11      11
    ## # ... with 61 more variables: cong <int>, cong_up <int>, zipcode <chr>,
    ## #   county_fips <chr>, tookpost <int>, weight_post <dbl>,
    ## #   starttime <dttm>, pid3 <int>, pid7 <int>, pid3_leaner <int>,
    ## #   ideo5 <fct>, gender <int>, birthyr <int>, age <int>, race <int>,
    ## #   hispanic <int>, educ <int>, faminc <fct>, economy_retro <int>,
    ## #   approval_pres <int>, approval_rep <fct>, approval_sen1 <fct>,
    ## #   approval_sen2 <fct>, approval_gov <int>, intent_pres_08 <fct>,
    ## #   intent_pres_12 <fct>, intent_pres_16 <fct>, voted_pres_08 <fct>,
    ## #   voted_pres_12 <fct>, voted_pres_16 <fct>, vv_regstatus <fct>,
    ## #   vv_party_gen <fct>, vv_party_prm <fct>, vv_turnout_gvm <fct>,
    ## #   vv_turnout_pvm <fct>, intent_rep <fct>, intent_sen <fct>,
    ## #   intent_gov <fct>, voted_rep <fct>, voted_sen <fct>, voted_gov <fct>,
    ## #   intent_rep_chosen <chr>, intent_rep_fec <chr>,
    ## #   intent_sen_chosen <chr>, intent_sen_fec <chr>,
    ## #   intent_gov_chosen <chr>, intent_gov_fec <chr>, voted_rep_chosen <chr>,
    ## #   voted_rep_fec <chr>, voted_sen_chosen <chr>, voted_sen_fec <chr>,
    ## #   voted_gov_chosen <chr>, voted_gov_fec <chr>, rep_current <chr>,
    ## #   rep_icpsr <int>, sen1_current <chr>, sen1_icpsr <int>,
    ## #   sen2_current <chr>, sen2_icpsr <int>, gov_current <chr>, gov_fec <chr>

Display frequencies of participation variable over time

``` r
tbl %>% group_by (year) %>% count (voted_sen) 
```

    ## # A tibble: 44 x 3
    ## # Groups:   year [12]
    ##     year voted_sen                       n
    ##    <int> <fct>                       <int>
    ##  1  2006 [Democrat / Candidate 1]    10715
    ##  2  2006 [Republican / Candidate 2]   8407
    ##  3  2006 [Other / Candidate 3]         153
    ##  4  2006 Not Sure                      292
    ##  5  2006 I Did Not Vote In This Race  2467
    ##  6  2006 <NA>                        14387
    ##  7  2007 <NA>                         9999
    ##  8  2008 [Democrat / Candidate 1]     5484
    ##  9  2008 [Republican / Candidate 2]   5918
    ## 10  2008 [Other / Candidate 3]         184
    ## # ... with 34 more rows

Display full table frequencies

``` r
tbl %>% group_by (year) %>% count (voted_sen) %>% View
```

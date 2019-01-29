Data cleaning
================
Jenny
January 2019

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

Look at all variable names in file

``` r
names(tbl)
```

    ##  [1] "year"              "case_id"           "weight"           
    ##  [4] "weight_cumulative" "state"             "st"               
    ##  [7] "cd"                "dist"              "dist_up"          
    ## [10] "cong"              "cong_up"           "zipcode"          
    ## [13] "county_fips"       "tookpost"          "weight_post"      
    ## [16] "starttime"         "pid3"              "pid7"             
    ## [19] "pid3_leaner"       "ideo5"             "gender"           
    ## [22] "birthyr"           "age"               "race"             
    ## [25] "hispanic"          "educ"              "faminc"           
    ## [28] "economy_retro"     "approval_pres"     "approval_rep"     
    ## [31] "approval_sen1"     "approval_sen2"     "approval_gov"     
    ## [34] "intent_pres_08"    "intent_pres_12"    "intent_pres_16"   
    ## [37] "voted_pres_08"     "voted_pres_12"     "voted_pres_16"    
    ## [40] "vv_regstatus"      "vv_party_gen"      "vv_party_prm"     
    ## [43] "vv_turnout_gvm"    "vv_turnout_pvm"    "intent_rep"       
    ## [46] "intent_sen"        "intent_gov"        "voted_rep"        
    ## [49] "voted_sen"         "voted_gov"         "intent_rep_chosen"
    ## [52] "intent_rep_fec"    "intent_sen_chosen" "intent_sen_fec"   
    ## [55] "intent_gov_chosen" "intent_gov_fec"    "voted_rep_chosen" 
    ## [58] "voted_rep_fec"     "voted_sen_chosen"  "voted_sen_fec"    
    ## [61] "voted_gov_chosen"  "voted_gov_fec"     "rep_current"      
    ## [64] "rep_icpsr"         "sen1_current"      "sen1_icpsr"       
    ## [67] "sen2_current"      "sen2_icpsr"        "gov_current"      
    ## [70] "gov_fec"

Select variables (example from Kuriwaki Guide)

``` r
tbl %>%
  select(year, case_id, pid3)
```

    ## # A tibble: 392,755 x 3
    ##     year case_id  pid3
    ##    <int>   <int> <int>
    ##  1  2006  439219     1
    ##  2  2006  439224     4
    ##  3  2006  439228     1
    ##  4  2006  439237     1
    ##  5  2006  439238     1
    ##  6  2006  439242     3
    ##  7  2006  439251     2
    ##  8  2006  439254     1
    ##  9  2006  439255     1
    ## 10  2006  439263     1
    ## # ... with 392,745 more rows

Note from Kuriwaki guide (p.3) - A labelled variable’s labels are not
shown immediately in the console, as is clear from output of previous
chunk. But labels can be displayed by transforming the labelled vector
into a factor.

library(haven) select(tbl, year, case\_id, pid3) %\>% mutate(pid3\_fct =
as\_factor(pid3))

Select variables (example from Kuriwaki Guide)

``` r
tbl %>%
  select(year, case_id, pid3)
```

    ## # A tibble: 392,755 x 3
    ##     year case_id  pid3
    ##    <int>   <int> <int>
    ##  1  2006  439219     1
    ##  2  2006  439224     4
    ##  3  2006  439228     1
    ##  4  2006  439237     1
    ##  5  2006  439238     1
    ##  6  2006  439242     3
    ##  7  2006  439251     2
    ##  8  2006  439254     1
    ##  9  2006  439255     1
    ## 10  2006  439263     1
    ## # ... with 392,745 more rows

Display frequencies of validated turnout General Election over time

``` r
tbl %>% 
  group_by (year) %>% 
  count (vv_turnout_gvm) 
```

    ## # A tibble: 21 x 3
    ## # Groups:   year [12]
    ##     year vv_turnout_gvm          n
    ##    <int> <fct>               <int>
    ##  1  2006 Voted               15575
    ##  2  2006 No Record Of Voting 20489
    ##  3  2006 No Voter File         357
    ##  4  2007 <NA>                 9999
    ##  5  2008 Voted               22235
    ##  6  2008 No Record Of Voting 10520
    ##  7  2008 No Voter File          45
    ##  8  2009 <NA>                13800
    ##  9  2010 Voted               33854
    ## 10  2010 No Record Of Voting 20215
    ## # ... with 11 more rows

Display table - frequencies of validated turnout General Election over
time

``` r
tbl %>% 
  group_by (year) %>% 
  count (vv_turnout_gvm) %>% 
  as.data.frame
```

Recode of vv\_turnout\_gvm to dichotomous

``` r
tbl <- tbl %>%
  mutate(vv_turnout_gvm_binary=as.numeric(vv_turnout_gvm=="Voted"))
```

Display frequencies of recoded Validated turnout General Election over
time

``` r
tbl %>% 
  group_by (year) %>% 
  count (vv_turnout_gvm_binary) 
```

    ## # A tibble: 18 x 3
    ## # Groups:   year [12]
    ##     year vv_turnout_gvm_binary     n
    ##    <int>                 <dbl> <int>
    ##  1  2006                     0 20846
    ##  2  2006                     1 15575
    ##  3  2007                    NA  9999
    ##  4  2008                     0 10565
    ##  5  2008                     1 22235
    ##  6  2009                    NA 13800
    ##  7  2010                     0 21546
    ##  8  2010                     1 33854
    ##  9  2011                    NA 20150
    ## 10  2012                     0 18133
    ## 11  2012                     1 36402
    ## 12  2013                    NA 16400
    ## 13  2014                     0 30891
    ## 14  2014                     1 25309
    ## 15  2015                    NA 14250
    ## 16  2016                     0 28771
    ## 17  2016                     1 35829
    ## 18  2017                    NA 18200

Display table, frequencies of recoded Validated turnout General Election
over time

``` r
tbl %>% 
  group_by (year) %>% 
  count (vv_turnout_gvm_binary) %>% 
  kable(align=c("l","c","c"))
```

| year | vv\_turnout\_gvm\_binary |   n   |
| :--- | :----------------------: | :---: |
| 2006 |            0             | 20846 |
| 2006 |            1             | 15575 |
| 2007 |            NA            | 9999  |
| 2008 |            0             | 10565 |
| 2008 |            1             | 22235 |
| 2009 |            NA            | 13800 |
| 2010 |            0             | 21546 |
| 2010 |            1             | 33854 |
| 2011 |            NA            | 20150 |
| 2012 |            0             | 18133 |
| 2012 |            1             | 36402 |
| 2013 |            NA            | 16400 |
| 2014 |            0             | 30891 |
| 2014 |            1             | 25309 |
| 2015 |            NA            | 14250 |
| 2016 |            0             | 28771 |
| 2016 |            1             | 35829 |
| 2017 |            NA            | 18200 |

JO exploring additional vars in dataset Year

``` r
tbl %>% 
  count (year) 
```

    ## # A tibble: 12 x 2
    ##     year     n
    ##    <int> <int>
    ##  1  2006 36421
    ##  2  2007  9999
    ##  3  2008 32800
    ##  4  2009 13800
    ##  5  2010 55400
    ##  6  2011 20150
    ##  7  2012 54535
    ##  8  2013 16400
    ##  9  2014 56200
    ## 10  2015 14250
    ## 11  2016 64600
    ## 12  2017 18200

tookpost - “Whether or not the respondent took the post-election wave of
the survey (in even years)”

``` r
tbl %>% 
  group_by(year) %>% 
  count(tookpost) 
```

    ## # A tibble: 18 x 3
    ## # Groups:   year [12]
    ##     year tookpost     n
    ##    <int>    <int> <int>
    ##  1  2006        0  7664
    ##  2  2006        1 28757
    ##  3  2007       NA  9999
    ##  4  2008        0  5779
    ##  5  2008        1 27021
    ##  6  2009       NA 13800
    ##  7  2010        0  8716
    ##  8  2010        1 46684
    ##  9  2011       NA 20150
    ## 10  2012        0  9700
    ## 11  2012        1 44835
    ## 12  2013       NA 16400
    ## 13  2014        0  7312
    ## 14  2014        1 48888
    ## 15  2015       NA 14250
    ## 16  2016        0 11701
    ## 17  2016        1 52899
    ## 18  2017       NA 18200

Weight - year-specific for all years, see Kuriwaki p.7 for notes

``` r
tbl %>% 
  group_by(year) %>% 
  count(weight) 
```

    ## # A tibble: 187,276 x 3
    ## # Groups:   year [12]
    ##     year weight     n
    ##    <int>  <dbl> <int>
    ##  1  2006  0.331  4620
    ##  2  2006  0.339   135
    ##  3  2006  0.346   239
    ##  4  2006  0.365   142
    ##  5  2006  0.372   433
    ##  6  2006  0.379   397
    ##  7  2006  0.406    88
    ##  8  2006  0.408   487
    ##  9  2006  0.422   101
    ## 10  2006  0.437   127
    ## # ... with 187,266 more rows

Weight - cumulative. Includes simple adjustment of multiplying a
constant within year to make years comparable.

``` r
tbl %>% 
  group_by(year) %>% 
  count(weight_cumulative) 
```

    ## # A tibble: 187,276 x 3
    ## # Groups:   year [12]
    ##     year weight_cumulative     n
    ##    <int>             <dbl> <int>
    ##  1  2006             0.241  4620
    ##  2  2006             0.246   135
    ##  3  2006             0.251   239
    ##  4  2006             0.265   142
    ##  5  2006             0.270   433
    ##  6  2006             0.275   397
    ##  7  2006             0.295    88
    ##  8  2006             0.296   487
    ##  9  2006             0.307   101
    ## 10  2006             0.318   127
    ## # ... with 187,266 more rows

Geographic variables \*State - imputed from input zipcode

``` r
tbl %>% 
  count(state) 
```

    ## # A tibble: 51 x 2
    ##    state                    n
    ##    <chr>                <int>
    ##  1 Alabama               5106
    ##  2 Alaska                 881
    ##  3 Arizona               9928
    ##  4 Arkansas              3703
    ##  5 California           37821
    ##  6 Colorado              6824
    ##  7 Connecticut           4622
    ##  8 Delaware              1455
    ##  9 District of Columbia   878
    ## 10 Florida              28879
    ## # ... with 41 more rows

Geographic variables \*St - same data as “State”, Var name = 2-letter
State abbreviation

``` r
tbl %>% 
  count(st) 
```

    ## # A tibble: 51 x 2
    ##    st        n
    ##    <chr> <int>
    ##  1 AK      881
    ##  2 AL     5106
    ##  3 AR     3703
    ##  4 AZ     9928
    ##  5 CA    37821
    ##  6 CO     6824
    ##  7 CT     4622
    ##  8 DC      878
    ##  9 DE     1455
    ## 10 FL    28879
    ## # ... with 41 more rows

Geographic variables \*cd: Congressional district in current Congress

``` r
tbl %>% 
  count(state) 
```

    ## # A tibble: 51 x 2
    ##    state                    n
    ##    <chr>                <int>
    ##  1 Alabama               5106
    ##  2 Alaska                 881
    ##  3 Arizona               9928
    ##  4 Arkansas              3703
    ##  5 California           37821
    ##  6 Colorado              6824
    ##  7 Connecticut           4622
    ##  8 Delaware              1455
    ##  9 District of Columbia   878
    ## 10 Florida              28879
    ## # ... with 41 more rows

Gender

``` r
tbl %>% 
  count(gender) 
```

    ## # A tibble: 2 x 2
    ##   gender      n
    ##    <int>  <int>
    ## 1      1 184273
    ## 2      2 208482

Age

``` r
tbl %>% 
  count(age) 
```

    ## # A tibble: 85 x 2
    ##      age     n
    ##    <int> <int>
    ##  1    18  3164
    ##  2    19  3794
    ##  3    20  3746
    ##  4    21  4184
    ##  5    22  4413
    ##  6    23  4588
    ##  7    24  5177
    ##  8    25  5394
    ##  9    26  6158
    ## 10    27  6168
    ## # ... with 75 more rows

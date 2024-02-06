Input -->


| ID | event | YEAR | GOLD          | SILVER        | BRONZE       |
|----|-------|------|---------------|---------------|--------------|
| 1  | 100m  | 2016 | Amthhew Mcgarray | donald        | barbara      |
| 2  | 200m  | 2016 | Nichole       | Alvaro Eaton  | janet Smith  |
| 3  | 500m  | 2016 | Charles       | Nichole       | Susana       |
| 4  | 100m  | 2016 | Ronald        | maria         | paula        |
| 5  | 200m  | 2016 | Alfred        | carol         | Steven       |
| 6  | 500m  | 2016 | Nichole       | Alfred        | Brandon      |
| 7  | 100m  | 2016 | Charles       | Dennis        | Susana       |
| 8  | 200m  | 2016 | Thomas        | Dawn          | catherine    |
| 9  | 500m  | 2016 | Thomas        | Dennis        | paula        |
| 10 | 100m  | 2016 | Charles       | Dennis        | Susana       |
| 11 | 200m  | 2016 | jessica       | Donald        | Stefeney     |
| 12 | 500m  | 2016 | Thomas        | Steven        | Catherine    |


Output -->


| name             | total |
|------------------|-------|
| Amthhew Mcgarray | 1     |
| Charles          | 3     |
| jessica          | 1     |
| Ronald           | 1     |
| Thomas           | 3     |


approach can be using subquery and filtering the records in gold column that are not present in silver and bronze column


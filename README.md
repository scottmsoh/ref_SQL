## ref_SQL
ref_SQL informtaion</br>

### 서브쿼리

1) SELECT 절 사용 : 스칼라 쿼리2</br>

캐싱</br>
입력 출력값을 캐싱에 적어놈</br>
인사팀, 쿼리에서 캐싱을 바로 뽑아서 출력해줌</br>
부서 distinct 10개 성능 좋음</br>
부서 100개 너무 많음, 성능 안좋음</br>

SELECT(SELECT function(xxx) FROM DUAL) FROM table;</br>


3) WHERE 절 사용 : 중첩 서브쿼리 O</br>

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(null,null, 'ALLSTATS LAST'));</br>
   
4) FROM 절 사용 : inline view</br>

   SELECT A.depeartment_name, B.AVG_SAL</br>
   FROM departments A,</br>
     (SELECT department_id, ROUND(AVG(salary),2) AVG_SAL</br>
     FROM employees</br>
     GROUP by department_id) B</br>

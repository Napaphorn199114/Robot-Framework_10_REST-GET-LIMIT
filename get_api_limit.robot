*** Settings ***
Library    REST

*** Test Cases ***
GET REQUEST LIMIT5
    GET    https://jsonplaceholder.typicode.com/users?_limit=5    timeout=30    headers={"Authentication":""}    #กำหนด api limit = 5,  timeout 30s 
    Array    response body    #ข้อมูลเป็น array
    Integer    $[0].id    1    #index ที่ 0 มีค่าเท่ากับ 1   -> index[0] = 1
    String    $[0]..city    Gwenborough
    String    $[0]..bs    harness real-time e-markets
    String    $[0]..lat    -37.3159    #.. คือลำดับของ path ต้องเข้าไป 2 ชั้นจะเจอ lat คือจาก address -> geo -> lat
    Integer    $..id    maximum=5    #limit =5  , .. ลำดับ path  Ex. 5 items -> 0 -> id:1     ...
    Output    $..id    #แสดง id ทั้งหมด

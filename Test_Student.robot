*** Settings ***
Library    SeleniumLibrary
Library    DateTime 
Library    ExcelLibrary
Library    ExcelRobot            

 
      


*** Variables ***
${browser}    chrome
         
    
*** Test Cases ***
Test_Student
    Open Excel    C:/Users/CHROME/Desktop/PFS_Portal.xlsx
    ${BaseUrl}=    Read Cell Data By Name    Student_Login    A2    
    ${In_Username}=    Read Cell Data By Name    Student_Login    B2                 
    ${In_Password}=    Read Cell Data By Name    Student_Login    C2    
    ${Val_Username}=    Read Cell Data By Name    Student_Login    B3        
    ${Val_Password}=    Read Cell Data By Name    Student_Login    C3     
    Close All Excel Documents    
    Open Browser    ${BaseUrl}    ${browser}
    wait
    Maximize Browser Window
    Click Button    xpath=//*[@id="app"]/div/main/div[2]/div[2]/form/div[2]/div/button
    wait
    Select Window    New     
    Input Text    xpath=//*[@id="i0116"]    ${In_Username}
    Click Button    xpath=//*[@id="idSIButton9"]
    Page Should Contain    This username may be incorrect. Make sure you typed it correctly. Otherwise, contact your admin.    
    wait
    Input Text    xpath=//*[@id="i0116"]    ${Val_Username}
    Click Button    xpath=//*[@id="idSIButton9"]
    wait
    Input Text    xpath=//*[@id="i0118"]   ${In_Password}
    Click Button    xpath=//*[@id="idSIButton9"]
    # Page Should Contain    Your account or password is incorrect. If you don't remember your password, reset it now. 
    wait   
    Input Text    xpath=//*[@id="i0118"]   ${Val_Password}
    Click Button    xpath=//*[@id="idSIButton9"]
    Select Window    MAIN
    Sleep    10
    Element Text Should Be    xpath=//*[@id="app"]/div/div/header/div/header/div/h6    PARENT PORTAL      
    Sleep    5    
    Click Element    xpath=//*[@id="app"]/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]/span       
    wait
    Click Element    xpath=//*[@id="menu-appbar"]/div[3]/ul/li[1]/a 
    wait
    Element Text Should Be    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div[1]/div/div[2]/div[2]/p    Ritu Tiwari       
    Sleep    10    
    Click Element    xpath=//*[@id="simple-tabpanel-0"]/div/div/div/div/div[3]/div/p    
    wait
    ${Attendance}=    Get Text    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div[2]/div/div[1]/div/div/div/div[4]/div[1]/div/div/div/div[1]/p[2]
    wait
    Log    ${Attendance}
    wait
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div[1]/p    
    wait
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div
    wait
    Click Button    xpath=//*[@id="popup"]/div/div[3]/div[2]/p/button
    Sleep    10   
    # Handle Alert    action=ACCEPT 
    # wait
    Click Element    xpath=//*[@id="app"]/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]/span
    wait
    Click Element    //*[@id="menu-appbar"]/div[3]/ul/li[2]/div 
    wait
    Close Browser
    
Test_faculty
    ${CurrentDate}    Get Current Date    result_format=%Y-%m-%d
    Log    ${CurrentDate}
    Open Excel    D:/Eclipse work/Student/Testing/PFS_Portal.xlsx
    ${BaseUrl}=    Read Cell Data By Name    Faculty_Login    A2        
    ${FIn_username}=    Read Cell Data By Name    Faculty_Login    B2       
    ${Fin_password}=    Read Cell Data By Name    Faculty_Login    C2        
    ${Fva_username}=    Read Cell Data By Name    Faculty_Login    B3    
    ${Fva_password}=    Read Cell Data By Name    Faculty_Login    C3    
    Close All Excel Documents        
    Open Browser    ${BaseUrl}    ${browser}
    wait
    Maximize Browser Window
    Click Button    xpath=//*[@id="app"]/div/main/div[2]/div[2]/form/div[2]/div/button
    wait     
    Select Window    New     
    Input Text    xpath=//*[@id="i0116"]    ${FIn_username}
    Click Button    xpath=//*[@id="idSIButton9"]
    Page Should Contain    This username may be incorrect. Make sure you typed it correctly. Otherwise, contact your admin.    
    wait
    Input Text    xpath=//*[@id="i0116"]    ${Fva_username}
    Click Button    xpath=//*[@id="idSIButton9"]
    wait
    Input Text    xpath=//*[@id="i0118"]   ${Fin_password}
    Click Button    xpath=//*[@id="idSIButton9"]
    Page Should Contain    Your account or password is incorrect. If you don't remember your password, reset it now. 
    wait   
    Input Text    xpath=//*[@id="i0118"]   ${Fva_password}
    Click Button    xpath=//*[@id="idSIButton9"]
    Select Window    MAIN
    Sleep    10       
    Element Text Should Be    xpath=//*[@id="app"]/div/div/header/div/header/div/h6    FACULTY PORTAL
    wait        
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div
    wait
    Click Button    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[2]/div/div[3]/div[2]/p/button
    Sleep    10    
    Select Window    Ken42 Online Classroom - CSE - Course I - Offering A Term 1
    Sleep    10    
    Click Element    xpath=/html/body/div[2]/div/div/header/button/span[1]   
    wait
    Element Text Should Be    xpath=//*[@id="app"]/main/section/div[1]/header/div/div[1]/div[2]/h1    CSE - Course I - Offering A Term 1  
    wait
    Select Window    Portal 
    wait
    # Click Element    xpath=//*[@id="app"]/div/div/div/div/div/div[3]/div[1]/ul/a[1]/div
    # wait
    # Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div[7]/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div
    # wait  
    Click Button    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[2]/div/div[4]/div[2]/a/button 
    wait
    Element Text Should Be    xpath=//*[@id="app"]/div/div/main/div[2]/div[1]/div/div[1]/h6    CSE - Course I
    Sleep    10    
    Select Checkbox    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div/div[3]/p/label/span[1]/span[1]/input
    wait
    Checkbox Should Be Selected    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div/div[3]/p/label/span[1]/span[1]/input
    wait
    Click Button    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/p/button    
    wait
    Unselect Checkbox    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div/div[3]/p/label/span[1]/span[1]/input
    Checkbox Should Not Be Selected    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div/div[3]/p/label/span[1]/span[1]/input
    wait
    Select Window    Ken42 Online Classroom - CSE - Course I - Offering A Term 1
    wait
    Click Element    xpath=/html/body/div/main/section/div[1]/header/div/div[1]/div[3]/div/button[1]/span[1]    
    wait
    Click Element    xpath=//*[@id="app"]/main/section/div[1]/header/div/div[1]/div[3]/div/div/div/ul/li[7]    
    wait
    Click Element    xpath=/html/body/div[2]/div/div/div[1]/div/div[2]/button[1]/span
    wait
    # Close Window
    Select Window    Portal
    # Click Button    xpath=//*[@id="app"]/div/div/main/div[2]/div[1]/div/div[2]/button      
    # Sleep    10        
    # Select Window    Ken42 Online Classroom - CSE - Course I - Offering A Term 1
    # Sleep    10    
    # Click Element    xpath=//*[@id="tippy-79"]/span[1]
    # wait
    # Element Text Should Be    xpath=//*[@id="app"]/main/section/div[1]/header/div/div[1]/div[2]/h1    CSE - Course I - Offering A Term 1
    # wait
    # Element Text Should Be    xpath=//*[@id="app"]/main/section/div[2]/div/div/div/div[3]/div[2]/div/div/div[1]/div/div[1]/div/div[2]/span/span    Debankur G 
    wait
    Click Element    xpath=//*[@id="app"]/div/div/div/div/div/div[3]/div[1]/ul/a[1]/div  
    wait      
    Click Element    xpath=//*[@id="app"]/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]/span
    wait
    Click Element    xpath=//*[@id="menu-appbar"]/div[3]/ul/li/div 
    wait
    Close Browser      
    
    
    

               
    
*** Variables ***
*** Keywords ***
wait
    
    Sleep    5
    
Testclass
     
    
   
    
        
    
       
    

    


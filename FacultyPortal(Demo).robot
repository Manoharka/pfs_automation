*** Settings ***
Library    SeleniumLibrary
Library    DateTime 
Library    ExcelLibrary
Library    ExcelRobot
  


*** Variables ***
${url}    https://dev-portal.ken42.com/
${browser}    chrome
${Faculty_email}    faculty@ken42.onmicrosoft.com
${Faculty_pass}    BAdv1V0xg7Pfe54qZxGuJA 


*** Test Cases ***
Test_faculty
    Login
    VerifyPortal
    Startclass&virtualclassroom
    verifyclassroom
    SubmitAttendance
    EndMeetinginvirtual
    Signout
       
   
    
    # Click Button    xpath=//*[@id="app"]/div/div/main/div[2]/div[1]/div/div[2]/button      
    # Sleep    10        
    # Select Window    Ken42 Online Classroom - CSE - Course I - Offering A Term 1
    # Sleep    10    
    # Click Element    xpath=//*[@id="tippy-79"]/span[1]
    # wait
    # Element Text Should Be    xpath=//*[@id="app"]/main/section/div[1]/header/div/div[1]/div[2]/h1    CSE - Course I - Offering A Term 1
    # wait
    # Element Text Should Be    xpath=//*[@id="app"]/main/section/div[2]/div/div/div/div[3]/div[2]/div/div/div[1]/div/div[1]/div/div[2]/span/span    Debankur G 
   
    
    

*** Keywords ***

    
Login
    ${CurrentDate}    Get Current Date    result_format=%Y-%m-%d
    Log    ${CurrentDate}
    Open Excel    C:/Users/CHROME/Desktop/PFS_Portal.xlsx
    ${BaseUrl}=    Read Cell Data By Name    Faculty_Login    A2    
    ${FIn_username}=    Read Cell Data By Name    Faculty_Login    B2   
    ${Fin_password}=    Read Cell Data By Name    Faculty_Login    C2    
    ${Fva_username}=    Read Cell Data By Name    Faculty_Login    B3
    ${Fva_password}=    Read Cell Data By Name    Faculty_Login    C3
    Close All Excel Documents        
    Open Browser    ${BaseUrl}    ${browser}
    Sleep    5
    Maximize Browser Window
    Click Button    xpath=//*[@id="app"]/div/main/div[2]/div[2]/form/div[2]/div/button
    Sleep    5    
    Select Window    New     
    Input Text    xpath=//*[@id="i0116"]    ${FIn_username}
    Click Button    xpath=//*[@id="idSIButton9"]
    Page Should Contain    This username may be incorrect. Make sure you typed it correctly. Otherwise, contact your admin.    
    Sleep    5
    Input Text    xpath=//*[@id="i0116"]    ${Fva_username}
    Click Button    xpath=//*[@id="idSIButton9"]
    Sleep    5
    Input Text    xpath=//*[@id="i0118"]   ${Fin_password}
    Click Button    xpath=//*[@id="idSIButton9"]
    # Page Should Contain    Your account or password is incorrect. If you don't remember your password, reset it now. 
    Sleep    5   
    Input Text    xpath=//*[@id="i0118"]   ${Fva_password}
    Click Button    xpath=//*[@id="idSIButton9"]
    Sleep    5    
    Click Element    xpath=//*[@id="idBtn_Back"]    
    
VerifyPortal
    Select Window    MAIN
    Sleep    15       
    Element Text Should Be    xpath=//*[@id="app"]/div/div/header/div/header/div/h6    FACULTY PORTAL
    Sleep    5        
    
Startclass&virtualclassroom
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div
    Sleep    5
    Click Button    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[2]/div/div[3]/div[2]/p/button
    Sleep    15    
    Select Window    Ken42 Live Class - CSE - Course I - Offering A Term 1
                        # Ken42 Online Classroom - CSE - Course I - Offering A Term 1
    Sleep    15   
    Click Element    xpath=/html/body/div[4]/div/div/header/button/span[1]
    Sleep    5
    Element Text Should Be    xpath=//*[@id="app"]/main/section/div[1]/header/div/div[1]/div[2]/h1    CSE - Course I - Offering A Term 1  
    Sleep    5
    
verifyclassroom
    Select Window    Portal 
    Sleep    5
    # Click Element    xpath=//*[@id="app"]/div/div/div/div/div/div[3]/div[1]/ul/a[1]/div
    # wait
    # Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div[7]/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div
    # wait  
    Click Button    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[2]/div/div[4]/div[2]/a/button 
    Sleep    5
    Element Text Should Be    xpath=//*[@id="app"]/div/div/main/div[2]/div[1]/div/div[1]/button/span    CSE - COURSE I
    Sleep    10    
    
SubmitAttendance
    Select Checkbox    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div[1]/div/div/div/div/ul/li/div[1]/div[2]/a/div/span/label/span[1]/span[1]/input
    Sleep    10
    # Checkbox Should Be Selected    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div[1]/div/div/div/div/ul/li/div[1]/div[2]/a/div/span/label/span[1]/span[1]/input
    Sleep    5
    Click Button    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[1]/button   
    Sleep    5
    Unselect Checkbox    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div[1]/div/div/div/div/ul/li/div[1]/div[2]/a/div/span/label/span[1]/span[1]/input
    # Checkbox Should Not Be Selected    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div[1]/div/div/div/div/ul/li/div[1]/div[2]/a/div/span/label/span[1]/span[1]/input
    Sleep    5
    
EndMeetinginvirtual
    Select Window    Ken42 Live Class - CSE - Course I - Offering A Term 1 
                     # Ken42 Online Classroom - CSE - Course I - Offering A Term 1
    Sleep    5
    Click Element    xpath=/html/body/div/main/section/div[1]/header/div/div[1]/div[3]/div/button[1]/span[1]    
    Sleep    5
    Click Element    xpath=//*[@id="app"]/main/section/div[1]/header/div/div[1]/div[3]/div/div/div/ul/li[7]    
    Sleep    5
    Click Element    xpath=/html/body/div[4]/div/div/div[1]/div/div[2]/button[1]/span
    Sleep    5
    
 Signout
    Select Window    Portal
    Click Element    xpath=//*[@id="app"]/div/div/div/div/div/div[3]/div[1]/ul/a[1]/div  
    Sleep    5      
    Click Element    xpath=//*[@id="app"]/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]/span
    Sleep    5
    Click Element    xpath=//*[@id="menu-appbar"]/div[3]/ul/li/div 
    Sleep    5
    Close Browser      
    


*** Settings ***
Library    SeleniumLibrary
Library    DateTime 
Library    ExcelLibrary
Library    ExcelRobot            
Library    AutoItLibrary    
Library    String    
 
      


*** Variables ***
${browser}    chrome
         
    
*** Test Cases ***
Test_faculty
    Login
    VerifyPortal
    Startclass&virtualclassroom
    verifyclassroom
    SubmitAttendance
    EndMeetinginvirtual
    Signout
     
       
    # Handle Alert    action=ACCEPT 
    # wait
        
    
    
    

               
    
*** Variables ***
*** Keywords ***
Login
    
    # Open Excel    C:/Users/CHROME/Desktop/Faculty_Login.xlsx
    Open Excel    ../pfs_automation/Faculty_Login.xlsx
    ${BaseUrl}=    Read Cell Data By Name    Faculty    A2    
    ${In_Username}=    Read Cell Data By Name    Faculty    B2                 
    # ${In_Password}=    Read Cell Data By Name    Student_Login    C2    
    ${Val_Username}=    Read Cell Data By Name    Faculty    B3        
    # ${Val_Password}=    Read Cell Data By Name    Student_Login    C3     
    Close All Excel Documents    
    Open Browser    ${BaseUrl}    ${browser}
    Sleep    10    
    Maximize Browser Window
    # Click Button    xpath=//*[@id="app"]/div/main/div[2]/div[2]/form/div[2]/div/button
    # Sleep    5     
    Input Text    xpath=//*[@id="app"]/div/div/main/div[3]/div[2]/div[2]/div[1]/div[2]/input    ${In_Username}
    Sleep    5    
    Click Element    xpath=//*[@id="app"]/div/div/main/div[3]/div[2]/div[2]/div[2]/div/button/span[1]  
    Sleep    10   
    Page Should Contain    Enter a valid email address
    Sleep    5
    Input Text    xpath=//*[@id="app"]/div/div/main/div[3]/div[2]/div[2]/div[1]/div[2]/input    ${Val_Username}
    Sleep    3    
    Click Element    xpath=//*[@id="app"]/div/div/main/div[3]/div[2]/div[2]/div[2]/div/button/span[1]
    Sleep    5
    Click Element    xpath=//*[@id="app"]/div/div/main/div[3]/div[2]/div[2]/div[2]/div/div[2]/div    
    # Page Should Contain    Your account or password is incorrect. If you don't remember your password, reset it now. 
    Sleep    5   
    Click Element    xpath=//*[@id="menu-"]/div[3]/ul/li
    Sleep    5    
    Click Element    xpath=//*[@id="app"]/div/div/main/div[3]/div[2]/div[2]/div[3]/div/button/span[1]
    Sleep    10    
    ${message}=    Handle Alert    action=ACCEPT
    Sleep    5   
    ${message1}=    Fetch From Right    ${message}    is:
    Input Text    xpath=//*[@id="app"]/div/div/main/div[3]/div[2]/div[2]/div[3]/div[2]/div[2]/input    ${message1} 
    Sleep    10
    Click Element    xpath=//*[@id="app"]/div/div/main/div[3]/div[2]/div[2]/div[4]/button/span[1]
    Sleep    5       
VerifyPortal
    Select Window    MAIN
    Sleep    25       
    Element Text Should Be    xpath=//*[@id="app"]/div/div/div/header/div/header/div/h6    FACULTY PORTAL
    Sleep    5        
    
Startclass&virtualclassroom
    Click Element    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div/div[2]/div/div
    Sleep    15    
    Click Button    xpath=//*[@id="popup"]/div/div[3]/div[2]/p/button
    Sleep    20    
    Select Window    Ken42 Live Class - 2021-MATH-KEN-SC-Grade09-B
                        # Ken42 Online Classroom - CSE - Course I - Offering A Term 1
    Sleep    15   
    Click Element    xpath=/html/body/div[4]/div/div/header/button/span[1]
    Sleep    10
    Element Text Should Be    xpath=//*[@id="app"]/main/section/div[1]/header/div/div[1]/div[2]/h1    2021-MATH-KEN-SC-Grade09-B
    Sleep    10
    
verifyclassroom
    Select Window    Portal 
    Sleep    10
    # Click Element    xpath=//*[@id="app"]/div/div/div/div/div/div[3]/div[1]/ul/a[1]/div
    # wait
    # Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div[7]/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div
    # wait  
    Click Button    xpath=//*[@id="popup"]/div/div[4]/div[2]/a/button
    Sleep    10
    Element Text Should Be    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div/div[1]/div/div[1]/h6    2021-MATH-KEN-SC-Grade09-B
    Sleep    10    
    
SubmitAttendance
    Select Checkbox    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div/div[2]/div/div[1]/div/div/div/div[3]/div/div[3]/p/label/span[1]/span[1]/input
    Sleep    10
    # Checkbox Should Be Selected    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div[1]/div/div/div/div/ul/li/div[1]/div[2]/a/div/span/label/span[1]/span[1]/input
    Sleep    5
    Click Button    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div/div[2]/div/div[1]/div/div/p/div/button   
    Sleep    5
    Unselect Checkbox    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div/div[2]/div/div[1]/div/div/div/div[3]/div/div[3]/p/label/span[1]/span[1]/input
    # Checkbox Should Not Be Selected    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div/div/div[4]/div[1]/div/div/div/div/ul/li/div[1]/div[2]/a/div/span/label/span[1]/span[1]/input
    Sleep    5
    
EndMeetinginvirtual
    Select Window    Ken42 Live Class - 2021-MATH-KEN-SC-Grade09-B 
                     # Ken42 Online Classroom - CSE - Course I - Offering A Term 1
    Sleep    5
    Click Element    xpath=/html/body/div[1]/main/section/div[1]/header/div/div[1]/div[3]/div[2]/button/span[1]    
    Sleep    5
    Click Element    xpath=//*[@id="app"]/main/section/div[1]/header/div/div[1]/div[3]/div/div/div/ul/li[7]    
    Sleep    5
    Click Element    xpath=/html/body/div[4]/div/div/div[1]/div/div[2]/button[1]/span
    Sleep    5
    
 Signout
    Select Window    Portal
    Click Element    xpath=//*[@id="app"]/div/div/div/main/div[3]/div/div/div/div[4]/div[1]/ul/a[1]/div/span[2]  
    Sleep    5      
    Click Element    xpath=//*[@id="app"]/div/div/div/header/div/header/div/div[2]/div/div/button/span[1]
    Sleep    5
    Click Element    xpath=//*[@id="menu-appbar"]/div[3]/ul/li/div 
    Sleep    5
    Close Browser    
      
       
    
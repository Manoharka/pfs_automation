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
Test_Student
    Login
    VerifyPortal
    Student_Profile
    Verify_Attendance
    Verify_Join_class
    Signout
    
       
    # Handle Alert    action=ACCEPT 
    # wait
        
    
    
    

               
    
*** Variables ***
*** Keywords ***
Login
    
    Open Excel    ../pfs_automation/Faculty_Login.xlsx
    ${BaseUrl}=    Read Cell Data By Name    Student    A2    
    ${In_Username}=    Read Cell Data By Name    Student    B2                 
    # ${In_Password}=    Read Cell Data By Name    Student_Login    C2    
    ${Val_Username}=    Read Cell Data By Name    Student    B3        
    # ${Val_Password}=    Read Cell Data By Name    Student_Login    C3     
    Close All Excel Documents    
    Open Browser    ${BaseUrl}    ${browser}
    Sleep    10    
    Maximize Browser Window
    # Click Button    xpath=//*[@id="app"]/div/main/div[2]/div[2]/form/div[2]/div/button
    # Sleep    5     
    Input Text    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div[2]/input    ${In_Username}
    Sleep    5    
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[2]/div/button/span[1]  
    Sleep    20   
    Page Should Contain    Enter a valid email address
    Sleep    5
    Input Text    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[1]/div[2]/input    ${Val_Username}
    Sleep    3    
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[2]/div/button/span[1]
    Sleep    5
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[2]/div/div[2]/div    
    # Page Should Contain    Your account or password is incorrect. If you don't remember your password, reset it now. 
    Sleep    5   
    Click Element    xpath=//*[@id="menu-"]/div[3]/ul/li
    Sleep    5    
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[3]/div/button/span[1]
    Sleep    10    
    ${message}=    Handle Alert    action=ACCEPT
    Sleep    5   
    ${message1}=    Fetch From Right    ${message}    is:
    Input Text    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[3]/div[2]/div[2]/input    ${message1} 
    Sleep    10
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div/div[4]/button/span[1]
    Sleep    5       
    
VerifyPortal
    Select Window    MAIN
    Sleep    15       
    Element Text Should Be    xpath=//*[@id="app"]/div/div/div/header/div/header/div/h6    STUDENT PORTAL
    Sleep    5   
    
Student_Profile
    Click Element    xpath=//*[@id="app"]/div/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]    
    Sleep    5    
    Click Element    xpath=//*[@id="menu-appbar"]/div[3]/ul/li[1]/a    
    Sleep    10
    Element Text Should Be    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div[2]/div[1]/div/div[2]/div[2]/p    Faizan Asif
    
Verify_Attendance
    Click Element    xpath=//*[@id="simple-tabpanel-0"]/div/div/div/div/div/div/div/p    
    Sleep    5    
    ${Attendance}=    Get Text    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div[2]/div[2]/div/div[1]/div/div/div/div[3]/div[1]/div/div/div/div[1]/p[2]
    Log To Console    ${Attendance}    
    Sleep    5  
    
Verify_Join_class
    Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)
    Sleep    5    
    Click Element    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div[1]/p    
    Sleep    15
    Click Element    xpath=//*[@id="app"]/div/div/div/main/div[4]/div/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div/div/div/div    
    Sleep    5    
    Click Element    xpath=//*[@id="popup"]/div/div[3]/div[2]/p/button/span[1]    
    Sleep    5    
    
Signout
    Click Element    xpath=//*[@id="app"]/div/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]    
    Sleep    5    
    Click Element    xpath=//*[@id="menu-appbar"]/div[3]/ul/li[2]/div
    Sleep    5   
    Close All Browsers 
            
      
    
                 
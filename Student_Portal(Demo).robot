*** Settings ***
Library    SeleniumLibrary
Library    DateTime 
Library    ExcelLibrary
Library    ExcelRobot            

 
      


*** Variables ***
${browser}    chrome
         
    
*** Test Cases ***
Test_Student
    Login
    VerifyPortal
    VerifyCoursedetails
    Verifyprofilename
    Verify Attendance
    VerifyJoinclass&schedule
    Signout
     
       
    # Handle Alert    action=ACCEPT 
    # wait
        
    
    
    

               
    
*** Variables ***
*** Keywords ***
Login
    
    Open Excel    C:/Users/CHROME/Desktop/PFS_Portal.xlsx
    ${BaseUrl}=    Read Cell Data By Name    Student_Login    A2    
    ${In_Username}=    Read Cell Data By Name    Student_Login    B2                 
    ${In_Password}=    Read Cell Data By Name    Student_Login    C2    
    ${Val_Username}=    Read Cell Data By Name    Student_Login    B3        
    ${Val_Password}=    Read Cell Data By Name    Student_Login    C3     
    Close All Excel Documents    
    Open Browser    ${BaseUrl}    ${browser}
    Sleep    5    
    Maximize Browser Window
    Click Button    xpath=//*[@id="app"]/div/main/div[2]/div[2]/form/div[2]/div/button
    Sleep    5
    Select Window    New     
    Input Text    xpath=//*[@id="i0116"]    ${In_Username}
    Click Button    xpath=//*[@id="idSIButton9"]
    Page Should Contain    This username may be incorrect. Make sure you typed it correctly. Otherwise, contact your admin.    
    Sleep    5
    Input Text    xpath=//*[@id="i0116"]    ${Val_Username}
    Click Button    xpath=//*[@id="idSIButton9"]
    Sleep    5
    Input Text    xpath=//*[@id="i0118"]   ${In_Password}
    Click Button    xpath=//*[@id="idSIButton9"]
    # Page Should Contain    Your account or password is incorrect. If you don't remember your password, reset it now. 
    Sleep    5   
    Input Text    xpath=//*[@id="i0118"]   ${Val_Password}
    Click Button    xpath=//*[@id="idSIButton9"]
    Sleep    5    
    Click Element    xpath=//*[@id="idBtn_Back"]
    Select Window    MAIN
    Sleep    10
    
VerifyPortal
    
    Execute Javascript    window.location.reload(true);
    Sleep    10    
    Element Text Should Be    xpath=//*[@id="app"]/div/div/header/div/header/div/h6    PARENT PORTAL      
    Sleep    5  
    
VerifyCoursedetails
    
    Click Element    xpath=//*[@id="app"]/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]/span       
    Sleep    5
    Click Element    xpath=//*[@id="menu-appbar"]/div[3]/ul/li[1]/a 
    Sleep    5
    
Verifyprofilename
    
    Element Text Should Be    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div[1]/div/div[2]/div[2]/p    Ritu Tiwari       
    Sleep    5    
    
Verify Attendance
    
    Click Element    xpath=//*[@id="simple-tabpanel-0"]/div/div/div/div/div[3]/div/p    
    Sleep    5
    ${Attendance}=    Get Text    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div[2]/div/div[1]/div/div/div/div[4]/div[1]/div/div/div/div[1]/p[2]
    Sleep    5
    Log    ${Attendance}
    Sleep    5
    
VerifyJoinclass&schedule
    
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div[1]/p    
    Sleep    5
    Click Element    xpath=//*[@id="app"]/div/div/main/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div
    Sleep    5
    Click Button    xpath=//*[@id="popup"]/div/div[3]/div[2]/p/button
    Sleep    5   
    
Signout
    
    Click Element    xpath=//*[@id="app"]/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]/span
    Sleep    5
    Click Element    //*[@id="menu-appbar"]/div[3]/ul/li[2]/div 
    Sleep    5
    Close Browser
    

    

     
    
   
    
        
    
       
    

    


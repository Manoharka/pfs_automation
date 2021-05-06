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
VKS_Student
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
    
    Open Excel    C:/Users/CHROME/Desktop/VKS_Portal.xlsx
    ${BaseUrl}=    Read Cell Data By Name    Student_Login    A2    
    ${In_Username}=    Read Cell Data By Name    Student_Login    B2                 
    # ${In_Password}=    Read Cell Data By Name    Student_Login    C2    
    ${Val_Username}=    Read Cell Data By Name    Student_Login    B3        
    # ${Val_Password}=    Read Cell Data By Name    Student_Login    C3     
    Close All Excel Documents    
    Open Browser    ${BaseUrl}    ${browser}
    Sleep    5    
    Maximize Browser Window
    # Click Button    xpath=//*[@id="app"]/div/main/div[2]/div[2]/form/div[2]/div/button
    # Sleep    5     
    Input Text    xpath=/html/body/div/div/main/div[2]/div[2]/div/div[1]/div[2]/input    ${In_Username}
    Sleep    3    
    Click Element    xpath=//*[@id="app"]/div/main/div[2]/div[2]/div/div[2]/div/button/span[1]  
    Sleep    5      
    # Click Button    xpath=//*[@id="idSIButton9"]
    Page Should Contain    Enter a valid email address
    Sleep    5
    Input Text    xpath=/html/body/div/div/main/div[2]/div[2]/div/div[1]/div[2]/input    ${Val_Username}
    Sleep    3    
    Click Element    xpath=//*[@id="app"]/div/main/div[2]/div[2]/div/div[2]/div/button/span[1]
    Sleep    5
    Click Element    xpath=//*[@id="app"]/div/main/div[2]/div[2]/div/div[2]/div/div[2]/div    
    # Page Should Contain    Your account or password is incorrect. If you don't remember your password, reset it now. 
    Sleep    5   
    Click Element    xpath=//*[@id="menu-"]/div[3]/ul/li    
    Sleep    5    
    Click Element    xpath=//*[@id="app"]/div/main/div[2]/div[2]/div/div[3]/div/button/span[1]
    Sleep    10    
    ${message}=    Handle Alert    action=ACCEPT
    Sleep    5   
    ${message1}=    Fetch From Right    ${message}    is${SPACE}
    Input Text    xpath=//*[@id="app"]/div/main/div[2]/div[2]/div/div[3]/div[2]/div[2]/input    ${message1} 
    Sleep    10
    Click Element    xpath=//*[@id="app"]/div/main/div[2]/div[2]/div/div[4]/button/span[1]
    Sleep    5          
    
    
VerifyPortal
    
    Execute Javascript    window.location.reload(true);
    Sleep    10    
    Element Text Should Be    xpath=//*[@id="app"]/div/div/header/div/header/div/h6    STUDENT PORTAL      
    Sleep    5  
    
VerifyCoursedetails
    
    Click Element    xpath=//*[@id="app"]/div/div/header/div/header/div/div[2]/div/div[4]/button/span[1]/span       
    Sleep    5
    Click Element    xpath=//*[@id="menu-appbar"]/div[3]/ul/li[1]/a 
    Sleep    5
    
Verifyprofilename
    
    Element Text Should Be    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div[1]/div/div[2]/div[2]/p    Dummy User1       
    Sleep    5    
    
Verify Attendance
    
    Click Element    xpath=//*[@id="simple-tabpanel-0"]/div/div/div/div/div[3]/div/p    
    Sleep    5
    ${Attendance}=    Get Text    xpath=//*[@id="app"]/div/div/main/div[2]/div[2]/div[2]/div/div[1]/div/div/div/div[3]/div[1]/div/div/div/div[1]/p[2]
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
    

    

     
    
   
    
        
    
       
    

    


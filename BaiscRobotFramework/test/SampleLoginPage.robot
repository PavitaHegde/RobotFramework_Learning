*** Settings ***
Library    SeleniumLibrary
Library    Screenshot 

Suite Setup  Log     I am in suite setup
Suite Teardown    Log    suite teardown

Default Tags    Sanity    

*** Variables ***
${URL}    https://dev.intempconnect.com/
@{Credentilas}    sqa.onset@gmail.com    Sqaonset@123
&{cred}    K1=sqa.onset@gmail.com    K2=Sqaonset@123

    
*** Keywords ***
LoginKeyword
     Input Text    xpath://input[@type='text']    ${cred}[K1]    # @{Credentilas}[0]
    Input Text    xpath://input[@type='password']    ${cred}[K2]    # @{Credentilas}[1]
    Click Element   xpath://button[@role='button']/span
   
  
*** Test Cases ***
LoginPageTestCase
    Log    Test Started
    Open Browser    ${URL}    chrome  
    Maximize Browser Window 
    Set Browser Implicit Wait    2
    Take Screenshot    
    LoginKeyword
    Select From List By Label    xpath://select[@class='valid-input account ellipsis']    Test Account    
    Click Element    xpath://div[@class='header-log-out-submit']/a
    Take Screenshot
    Close Browser
    Log    Test Completed    
    Log    Test ran on %{os} by user %{USERNAME}
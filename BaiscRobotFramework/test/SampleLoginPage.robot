*** Settings ***
Library    SeleniumLibrary
Library    Screenshot 

# Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
# Resource    resource.robot

Default Tags    Sanity    

*** Variables ***
${URL}    https://dev.intempconnect.com/
${username}    sqa.onset@gmail.com
${password}    Sqaonset@123   
@{Credentilas}    sqa.onset@gmail.com    Sqaonset@123
&{cred}    K1=sqa.onset@gmail.com    K2=Sqaonset@123

    
*** Keywords ***
LoginKeyword
    Input UsernameIntemp    ${username}
    # Input Text    xpath://input[@type='text']    ${cred}[K1]    # @{Credentilas}[0]
    Input Text    xpath://input[@type='password']    ${cred}[K2]    # @{Credentilas}[1]
    Click Element   xpath://button[@role='button']/span
   
Input UsernameIntemp
    [Arguments]    ${username}
     Input Text    xpath://input[@type='text']    ${username}    
  
*** Test Cases ***
LoginPageTestCase
    Log    Test Started
    Open Browser    ${URL}    chrome  
    Maximize Browser Window 
    Set Browser Implicit Wait    2
    Take Screenshot    
    LoginKeyword
    Click Element    xpath://div[@class='account-value']    
    Select From List By Label    xpath://select[@class='valid-input account ellipsis']        Test Account    
    Click Element    xpath://div[@class='header-log-out-submit']/a
    Take Screenshot
    Close Browser
    Log    Test Completed    
    Log    Test ran on %{os} by user %{USERNAME}
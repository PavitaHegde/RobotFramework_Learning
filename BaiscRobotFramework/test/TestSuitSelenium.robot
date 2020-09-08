*** Settings ****
Library    SeleniumLibrary
Default Tags    Smoke   
*** Test Cases ***

MyFirstCase
    Log To Console    Hello World...
    
SeleniumCase
    Open Browser    https:\\google.com     chrome    
    Set Browser Implicit Wait   5
    Maximize Browser Window
    Input Text    name=q    Automation Master  
    Sleep    2      
    Press Keys    name=q    ENTER
    # Click Button    name=btnK   
    Close Browser
    

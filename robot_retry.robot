*** Settings ***
Documentation       Testing some retry with TFParamService 

Library             squash_tf.TFParamService
Library             OperatingSystem
Library             String


*** Test Cases ***
Main Test
    ${dirname}=    Create New File In dirname
    Compare File Number    ${dirname}
    
*** Keywords ***
Create New File In dirname
    ${dirname}=    Get Test Param       DS_dirname
    Create Directory    ${dirname}
    ${filename}=    Generate Random String    10
    Create File    ${dirname}/${filename}
    RETURN    ${dirname}

Compare File Number
    [Arguments]    ${dirname}
    ${number}=    Count Items In Directory    ${dirname}
    ${retry_count}=    Get Test Param       DS_retrycount
    Should Be True    ${number}>${retry_count}
    

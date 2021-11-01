/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package errorObj;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class CreateNewErrorObj implements Serializable{
    private String idLengthError;
    private String fullnameLengthError;
    private String passwordLengthError;
    private String confirmNotMatch;
    private String emailValidation;
    private String userIsExisted;
    private String phoneLengthError;

    public CreateNewErrorObj() {
    }

    public CreateNewErrorObj(String idLengthError, String fullnameLengthError, String passwordLengthError, String confirmNotMatch, String emailValidation, String userIsExisted, String phoneLengthError) {
        this.idLengthError = idLengthError;
        this.fullnameLengthError = fullnameLengthError;
        this.passwordLengthError = passwordLengthError;
        this.confirmNotMatch = confirmNotMatch;
        this.emailValidation = emailValidation;
        this.userIsExisted = userIsExisted;
        this.phoneLengthError = phoneLengthError;
    }

    public String getIdLengthError() {
        return idLengthError;
    }

    public void setIdLengthError(String idLengthError) {
        this.idLengthError = idLengthError;
    }

    public String getFullnameLengthError() {
        return fullnameLengthError;
    }

    public void setFullnameLengthError(String fullnameLengthError) {
        this.fullnameLengthError = fullnameLengthError;
    }

    public String getPasswordLengthError() {
        return passwordLengthError;
    }

    public void setPasswordLengthError(String passwordLengthError) {
        this.passwordLengthError = passwordLengthError;
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }

    public String getEmailValidation() {
        return emailValidation;
    }

    public void setEmailValidation(String emailValidation) {
        this.emailValidation = emailValidation;
    }

    public String getUserIsExisted() {
        return userIsExisted;
    }

    public void setUserIsExisted(String userIsExisted) {
        this.userIsExisted = userIsExisted;
    }

    public String getPhoneLengthError() {
        return phoneLengthError;
    }

    public void setPhoneLengthError(String phoneLengthError) {
        this.phoneLengthError = phoneLengthError;
    }
   
    
}

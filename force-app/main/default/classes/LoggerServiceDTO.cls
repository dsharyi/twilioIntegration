public with sharing class LoggerServiceDTO {
    public String origin;
    public String errorBody;

    public LoggerServiceDTO (String origin, String errorBody){
        this.origin = origin;
        this.errorBody = errorBody;
    }

}
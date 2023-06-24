public class WeatherData {

    public WeatherData() {}

    @AuraEnabled @InvocableVariable
    public String name;

    @AuraEnabled @InvocableVariable
    public String country;

    @AuraEnabled @InvocableVariable
    public Long last_updated_epoch;

    @AuraEnabled @InvocableVariable
    public String last_updated;

    @AuraEnabled @InvocableVariable
    public Decimal temp_c;

    @AuraEnabled @InvocableVariable
    public Decimal temp_f;

    @AuraEnabled @InvocableVariable
    public Integer is_day;

    @AuraEnabled @InvocableVariable
    public Decimal wind_mph;

    @AuraEnabled @InvocableVariable
    public Decimal wind_kph;

    @AuraEnabled @InvocableVariable
    public Integer wind_degree;

    @AuraEnabled @InvocableVariable
    public String wind_dir;

    @AuraEnabled @InvocableVariable
    public Decimal pressure_mb;

    @AuraEnabled @InvocableVariable
    public Decimal pressure_in;

    @AuraEnabled @InvocableVariable
    public Decimal precip_mm;

    @AuraEnabled @InvocableVariable
    public Decimal precip_in;

    @AuraEnabled @InvocableVariable
    public Integer humidity;

    @AuraEnabled @InvocableVariable
    public Integer cloud;

    @AuraEnabled @InvocableVariable
    public Decimal feelslike_c;

    @AuraEnabled @InvocableVariable
    public Decimal feelslike_f;

    @AuraEnabled @InvocableVariable
    public Decimal vis_km;

    @AuraEnabled @InvocableVariable
    public Decimal vis_miles;

    @AuraEnabled @InvocableVariable
    public Decimal uv;

    @AuraEnabled @InvocableVariable
    public Decimal gust_mph;

    @AuraEnabled @InvocableVariable
    public Decimal gust_kph;
    
    @AuraEnabled @InvocableVariable
    public String text;

    @AuraEnabled @InvocableVariable
    public String icon;

    @AuraEnabled @InvocableVariable
    public Integer code;
}
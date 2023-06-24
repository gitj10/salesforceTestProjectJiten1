public class NewsData {

    public NewsData() {}
    
    @AuraEnabled @InvocableVariable
    public String author;

    @AuraEnabled @InvocableVariable
    public String title;

    @AuraEnabled @InvocableVariable
    public String description;

    @AuraEnabled @InvocableVariable
    public String url;

    @AuraEnabled @InvocableVariable
    public String urlToImage;

    @AuraEnabled @InvocableVariable
    public String publishedAt;

    @AuraEnabled @InvocableVariable
    public String content;

    @AuraEnabled @InvocableVariable
    public String id;

    @AuraEnabled @InvocableVariable
    public String name;      
}
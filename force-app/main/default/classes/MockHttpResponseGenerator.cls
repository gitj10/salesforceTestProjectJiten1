@IsTest
public class MockHttpResponseGenerator implements HttpCalloutMock {
    private Integer statusCode;
    private String statusReason;
    private String responseBody;
    
    public MockHttpResponseGenerator(Integer statusCode, String statusReason, String responseBody) {
        this.statusCode = statusCode;
        this.statusReason = statusReason;
        this.responseBody = responseBody;
    }
    
    public HttpResponse respond(HttpRequest request) {

        HttpResponse response = new HttpResponse();        
        response.setStatusCode(statusCode);
        response.setHeader('Content-Type', 'application/json');
        response.setBody(responseBody);
        return response;
    }
}
public class Client {
public String completeUrl{get;set;}  
public static  String OTP_TEST_URL = 'https://otp-dummy-int.csid.co';  
    public String callAPIWithRequest(String reqStr, String url ){  
        if(!test.isRunningTest()){  
             completeUrl = url;  
        }else{  
             completeUrl = OTP_TEST_URL+url;  
         }  
        String resStr = '';  
        Http http = new Http(); 
        HttpRequest request = new HttpRequest();  
        request.setTimeout(Constants.API_TIMEOUT); // timeout in milliseconds   
        request.setEndpoint(completeUrl);  
        request.setMethod('POST');  
        //request.setHeader('encryptRTN', '90000401');  
        request.setHeader('Content-Type','application/json'); 
       // request.setBody(reqStr);
       request.setBody(
      'grant_type=password'+'&client_id='+Constants.client_id +'&client_secret='+Constants.client_secret +'&username='+Constants.client_secret + 
      '&password='+Constants.password);   
        System.debug('######################### BEFOE SEND = '+request);   
        HttpResponse response = http.send(request);   
        System.debug('######################### AFTER SEND = ');  
        resStr = response.getBody();  
        System.debug('***** resStr = '+ resStr); 
        
return resStr;  
    } 

    public String callAPIWithTokenRequest(String reqStr, String url,String token ){  
        if(!test.isRunningTest()){  
             completeUrl = url;  
        }else{  
             completeUrl = OTP_TEST_URL+url;   
         }  
        String resStr = '';  
        Http http = new Http();  
        HttpRequest request = new HttpRequest();  
    //    request.setTimeout(OTPConstants.OTP_API_TIMEOUT); // timeout in milliseconds   
        request.setEndpoint(completeUrl); 
        request.setMethod('POST');  
        request.setHeader('Authorization', 'Bearer '+token);   
        request.setHeader('Content-Type','application/json');  
        request.setBody(reqStr);  
        System.debug('######################### BEFOE SEND = '+request); 
        HttpResponse response = http.send(request);   
        System.debug('######################### AFTER SEND = ');  
        resStr = response.getBody();  
        System.debug('***** resStr = '+ resStr);  
return resStr; 

    } 
}
public class GetOauth2Token {
    // GetOauth2Token.testToken();  
    public static  Get_Oauth2_Token_Res testToken(){  
         Get_Oauth2_Token_Res res = getOauth2Token(Constants.grant_type, Constants.client_id, Constants.client_secret); 
        return res;  
    } 
    
    public static  Get_Oauth2_Token_Res getOauth2Token(String grant_type,String client_id,String client_secret){  
         Get_Oauth2_Token_Req  tokenAccessReq = new  Get_Oauth2_Token_Req();  
        tokenAccessReq.grant_type = grant_type;  
        tokenAccessReq.client_id = client_id;  
        tokenAccessReq.client_secret = client_secret;  
        String jsonString = System.JSON.serialize(tokenAccessReq);  
        Client clients = new Client();  
        String jsonResponse = clients.callAPIWithRequest(jsonString,  Constants.GET_OAUTH_TOKEN_url);  
        System.debug('--Response-- '+( Get_Oauth2_Token_Res) System.JSON.deserialize(jsonResponse,  Get_Oauth2_Token_Res.class));
        return ( Get_Oauth2_Token_Res) System.JSON.deserialize(jsonResponse,  Get_Oauth2_Token_Res.class); 
        
    } 
}
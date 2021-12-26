public class Get_Oauth2_Token_Req {
    public String grant_type;  
    public String client_id;  
    public String client_secret;  
    public static Get_Oauth2_Token_Req parse(String json) {  
        return (Get_Oauth2_Token_Req) System.JSON.deserialize(json, Get_Oauth2_Token_Req.class); 
        
    } 
}
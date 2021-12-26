public class Get_Oauth2_Token_Res { 
    public String access_token;  
    public String token_type;  
    public Integer expires_in;  
    public String expires;  
    public String error;  
    public String error_description;     
    
    public static Get_Oauth2_Token_Res parse(String json) {          
        return (Get_Oauth2_Token_Res) System.JSON.deserialize(json, Get_Oauth2_Token_Res.class); 
        
    } 
}
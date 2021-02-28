package com.scrape.app;
import com.ebay.api.client.auth.oauth2.CredentialUtil;
import com.ebay.api.client.auth.oauth2.OAuth2Api;
import com.ebay.api.client.auth.oauth2.model.*;

import java.io.*;
import java.util.ArrayList;
import java.util.Optional;

/**
 * Hello world!
 *
 */
public class scraper {
    public static void main(String[] args) {
        File file = new File("C:/Users/kshim/hackutd2021/scrape-app/ebay-config.yaml");
        try {
            CredentialUtil.load(new FileInputStream(file));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<String> scope = new ArrayList<String>();
        scope.add("https://api.ebay.com/oauth/api_scope/buy.offer.auction");
        scope.add("https://api.ebay.com/oauth/api_scope/buy.marketing");

        try {
            String state = null;
            Optional<String> foo = Optional.ofNullable(state);
            OAuth2Api auth = new OAuth2Api();

            String oApi = auth.generateUserAuthorizationUrl(Environment.SANDBOX, scope, foo);
            System.out.println(oApi);

        } catch (Exception e) {
            
            e.printStackTrace();
        }

    }
}

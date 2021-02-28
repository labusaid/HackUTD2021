package com.scrape.app;
import com.ebay.api.client.auth.oauth2.CredentialUtil;
import com.ebay.api.client.auth.oauth2.OAuth2Api;
import com.ebay.api.client.auth.oauth2.model.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;

/**
 * Hello world!
 *
 */
public class scraper {
    public static void main(String[] args) {
        String file = "C:/Users/kshim/hackutd2021/scrape-app/ebay-config.yaml";
        try {
            CredentialUtil.load(new FileInputStream(file));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<String> scope = new ArrayList<String>();
        scope.add("https://api.ebay.com/oauth/api_scope/buy.offer.auction");
        scope.add("https://api.ebay.com/oauth/api_scope/buy.marketing");

        OAuth2Api auth = new OAuth2Api();
        String userAuthUrl = auth.generateUserAuthorizationUrl(Environment.SANDBOX, scope, null);
        System.out.println(userAuthUrl);

    }
}

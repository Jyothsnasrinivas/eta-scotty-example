{-# LANGUAGE OverloadedStrings, TemplateHaskell, QuasiQuotes, ScopedTypeVariables #-}

import Web.Scotty

import Data.Monoid (mconcat)
import Data.FileEmbed
import Data.Text.Lazy (Text)
import Data.Text.Lazy.Encoding
import Text.Hamlet
import Text.Blaze.Html.Renderer.Text

main = scotty 3000 $
    get "/:word" $ do
        message :: Text <- param "word"

        -- html [$(embedStringFile "./resources/index.html")]
         -- mconcat ["<h2>Eta is running", beam, " Scotty!</h2>"]
        html $ renderHtml [shamlet|
         <!DOCTYPE html>
         <html>
           <head>
             <title>Eta is running on Scotty!
           <body style="background-color: #2cd4d9">
             <div class="box">
               <h1 style="color: #ffffff; text-align: center;">Scotty example in Eta!
               <h3 style="color: #ffffff; text-align: center;">#{message}
           <style>
             .box{
                  width: 400px;
                  background: #43414e;
                  border-radius: 10px;
                  padding: 60px;
                  margin: auto;
                  position: relative;
                  top: 250px;
                  -webkit-box-shadow: 0 10px 6px -6px #777;
                  -moz-box-shadow: 0 10px 6px -6px #777;
                  box-shadow: 0 10px 6px -6px #777;
                 }

         |]

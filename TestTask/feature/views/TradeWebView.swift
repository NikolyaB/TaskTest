//
//  TradeWebView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI
import WebKit

  
struct TradeWebView: UIViewRepresentable {
    private var htmlString: String = ""
    let link: Int
    
    init(link: Int) {
        self.link = link
        if link == 0 {
            htmlString = """
        <!-- TradingView Widget BEGIN -->
        <div class="tradingview-widget-container" style="height:100%;width:100%">
          <div id="tradingview_f0d17" style="height:calc(100% - 32px);width:100%"></div>
          <div class="tradingview-widget-copyright"><a href="https://ru.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Все рынки на TradingView</span></a></div>
          <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
          <script type="text/javascript">
          new TradingView.widget(
          {
          "autosize": true,
          "symbol": "FX_IDC:USDRUB",
          "interval": "D",
          "timezone": "Etc/UTC",
          "theme": "dark",
          "style": "1",
          "locale": "ru",
          "enable_publishing": false,
          "hide_top_toolbar": true,
          "hide_legend": true,
          "save_image": false,
          "hide_volume": true,
          "container_id": "tradingview_f0d17"
        }
          );
          </script>
        </div>
        <!-- TradingView Widget END -->
        """
        } else {
            htmlString = """
        <!-- TradingView Widget BEGIN -->
        <div class="tradingview-widget-container" style="height:100%;width:100%">
          <div id="tradingview_37207" style="height:calc(100% - 32px);width:100%"></div>
          <div class="tradingview-widget-copyright"><a href="https://ru.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Все рынки на TradingView</span></a></div>
          <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
          <script type="text/javascript">
          new TradingView.widget(
          {
          "autosize": true,
          "symbol": "FX:EURUSD",
          "interval": "D",
          "timezone": "Etc/UTC",
          "theme": "dark",
          "style": "1",
          "locale": "ru",
          "enable_publishing": false,
          "hide_top_toolbar": true,
          "hide_legend": true,
          "save_image": false,
          "hide_volume": true,
          "container_id": "tradingview_37207"
        }
          );
          </script>
        </div>
        <!-- TradingView Widget END -->
        """
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}

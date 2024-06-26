//
//  CurrencyDataService.swift
//  CurrencyCalculator
//
//  Created by Pawan Bohora on 5/16/24.
//

import Foundation

/*
Json Data
{
   "base_currency":"USD",
   "time":"03-22-2019 10:00:02",
   "timestamp":1553248802,
   "rates":{
      "AED":3.6733,
      "AFN":76.05,
      "ALL":110.1196,
      "AMD":486.9206,
      "ANG":1.8392,
      "AOA":316.854,
      "ARS":41.025,
      "AUD":1.4099,
      "AWG":1.801,
      "AZN":1.705,
      "BAM":1.7205,
      "BBD":1.9953,
      "BDT":84.232,
      "BGN":1.73,
      "BHD":0.3771,
      "BIF":1809.95,
      "BMD":1,
      "BND":1.3506,
      "BOB":6.9041,
      "BRL":3.7927,
      "BSD":1.0005,
      "BTN":69.0055,
      "BWP":10.656,
      "BYR":19600,
      "BZD":2.0197,
      "CAD":1.3375,
      "CDF":1630,
      "CHF":0.9964,
      "CLP":667.4036,
      "CNY":6.7131,
      "COP":3089,
      "CRC":598.295,
      "CUP":26.5,
      "CVE":97.1965,
      "CZK":22.7319,
      "DJF":177.72,
      "DKK":6.6003,
      "DOP":50.715,
      "DZD":118.825,
      "EGP":17.252,
      "ERN":14.9997,
      "ETB":28.523,
      "EUR":0.8845,
      "FJD":2.1228,
      "FKP":0.76,
      "GBP":0.763,
      "GEL":2.685,
      "GHS":5.232,
      "GIP":0.76,
      "GMD":49.665,
      "GNF":9142.9029,
      "GTQ":7.7052,
      "GYD":208.455,
      "HKD":7.8471,
      "HNL":24.496,
      "HRK":6.5618,
      "HTG":82.8325,
      "HUF":279.337,
      "IDR":14187.55,
      "ILS":3.6125,
      "INR":68.98,
      "IQD":1196,
      "IRR":42105.0001,
      "ISK":118.77,
      "JMD":125.0002,
      "JOD":0.709,
      "JPY":110.5194,
      "KES":100.6989,
      "KGS":69.7563,
      "KHR":4003.9502,
      "KMF":432.7006,
      "KPW":900.0853,
      "KRW":1133.5973,
      "KWD":0.3035,
      "KYD":0.8353,
      "KZT":378.4803,
      "LAK":8605.297,
      "LBP":1513.8497,
      "LKR":178.1502,
      "LRD":162.125,
      "LSL":14.3802,
      "LYD":1.388,
      "MAD":9.6189,
      "MDL":17.307,
      "MGA":3563.2112,
      "MKD":54.1195,
      "MMK":1533.5499,
      "MNT":2630.9246,
      "MOP":8.1017,
      "MUR":34.5265,
      "MVR":15.492,
      "MWK":723.985,
      "MXN":18.9725,
      "MYR":4.0606,
      "MZN":63.2301,
      "NAD":14.3801,
      "NGN":361.84,
      "NIO":32.9555,
      "NOK":8.5262,
      "NPR":109.955,
      "NZD":1.4558,
      "OMR":0.385,
      "PAB":1.0005,
      "PEN":3.2879,
      "PGK":3.3755,
      "PHP":52.5155,
      "PKR":140.1702,
      "PLN":3.7946,
      "PYG":6162.7502,
      "QAR":3.641,
      "RON":4.206,
      "RSD":104.3399,
      "RUB":64.0834,
      "RWF":903.735,
      "SAR":3.75,
      "SBD":8.0557,
      "SCR":13.6745,
      "SDG":47.7279,
      "SEK":9.2607,
      "SGD":1.351,
      "SHP":1.3209,
      "SLL":8875.0003,
      "SOS":581.9998,
      "SRD":7.458,
      "SVC":8.7708,
      "SYP":515.0002,
      "SZL":14.269,
      "THB":31.69,
      "TJS":9.4613,
      "TMT":3.5,
      "TND":3.0197,
      "TOP":2.2572,
      "TRY":5.5488,
      "TTD":6.7911,
      "TWD":30.827,
      "TZS":2344.103,
      "UAH":27.1951,
      "UGX":3708.5025,
      "USD":1,
      "UYU":33.24,
      "UZS":8396.1022,
      "VEF":9.9875,
      "VND":23201.5,
      "VUV":113.8588,
      "WST":2.5987,
      "XAF":577.0605,
      "XCD":2.7033,
      "XDR":0.7187,
      "XOF":577.0602,
      "XPF":104.9098,
      "YER":250.3504,
      "ZAR":14.3397,
      "ZMW":12.029,
      "ZWL":322.355
   }
}

*/

import Combine

class MarketDataService {
    
    @Published var marketData: CurrencyModel?
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }

    private func getData() {
        
        guard let url = URL(string: "https://mocki.io/v1/d99e3a67-d001-45a8-93b2-7ca8da995463")
        else { return }
        
        print("PRINT \(url)")

        marketDataSubscription = NetworkManager.download(url: url)
            .decode(type: CurrencyModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData
                ///Cancels the request
                 self?.marketDataSubscription?.cancel()
                }
            )
    }
    
    
}

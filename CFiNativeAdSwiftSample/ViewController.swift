//
//  ViewController.swift
//  CFiNativeAdSwiftSample
//
//  Created by 郭堯彰 on 2018/3/30.
//  Copyright © 2018年 cf. All rights reserved.
//

import UIKit
import iMFAD

class ViewController: UIViewController {

    @IBOutlet var adView: UIView!
    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var adTitle: UILabel!
    @IBOutlet var adBody: UILabel!
    @IBOutlet var advertiser: UILabel!
    @IBOutlet var adButtonText: UIButton!
    
    private var native :MFNativeAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.native = MFNativeAd();
        self.native?.bannerId = "8384"; //測試版位
        self.native?.delegate = self;
        self.native?.request();
        
        let color = UIColor.black;
        self.adView.layer.borderColor = color.cgColor;
        self.adView.layer.borderWidth = 1.0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:MFNativeDelegate{
    
    func onMFNativeAdDidLoad(_ nativeAd: MFNativeAd) {
        
        self.adTitle.text = nativeAd.title;
        self.adBody.text = nativeAd.content;
        self.adButtonText.setTitle(nativeAd.buttonTitle, for: .normal);
        self.advertiser.text = nativeAd.advertiser;
        nativeAd.coverImg?.loadAsync(block: { image in
            self.coverImage.image = image;
        })
        nativeAd.registerElementsView(self.adView, clickView: [self.adTitle,self.adBody,self.adButtonText], controllervw: self);
    }
    
    
    
    func onMFNativeAdRequestFail() {
        print("請求廣告失敗");
    }
    
    func onMFNativeAdClick(_ nativeAd: MFNativeAd) {
        print("Click Ad");
    }
}


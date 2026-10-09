//
//  GoogleMapsSupport.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 09/10/26.
//

@preconcurrency import GoogleMaps

public enum GoogleMapsSupportModule {
    public static var sdkVersion: String {
        GMSServices.sdkVersion()
    }
}

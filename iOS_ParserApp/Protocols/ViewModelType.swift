//
//  ViewModelType.swift
//  iOS_ParserApp
//
//  Created by Denys Melnyk on 01.06.2022.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    associatedtype Dependencies
    
    func transform(_ input: Input) -> Output
}

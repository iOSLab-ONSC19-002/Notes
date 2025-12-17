//
//  NoteModel.swift
//  Notes
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/12/25.
//

import Foundation

// Model
struct Note: Identifiable {
	let id = UUID()
	var title: String
	var body: String
	var date: Date
}

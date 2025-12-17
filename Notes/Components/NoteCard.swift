//
//  NoteCard.swift
//  Notes
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/12/25.
//

import Foundation
import SwiftUI

struct NoteCard: View {
	
	let note: Note
	
	let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd/MM/yyyy"
		return formatter
	}()
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .top) {
				Text("Título: \(note.title)")
					.font(.title2)
					.bold()
				
				Spacer()
				
				Text("Data: \(dateFormatter.string(from: note.date))")
					.font(.callout)
					.foregroundStyle(.secondary)
			}
			
			Divider()
			
			Text(note.body)
				.font(.body)
				.padding(.top, 5)
		}
		.padding()
		.background(
			RoundedRectangle(cornerRadius: 16)
				.foregroundStyle(.secondary.opacity(0.3))
				.shadow(radius: 2)
		)
		.padding()
	}
}

#Preview {
	NoteCard(note: Note(title: "Boa noite!", body: "Este é o corpo da nota de boa noite.", date: Date.now))
}

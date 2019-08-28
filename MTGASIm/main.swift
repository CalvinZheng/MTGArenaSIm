//
//  main.swift
//  MTGASIm
//
//  Created by Haomin Zheng on 2019-07-12.
//  Copyright © 2019 Haomin Zheng. All rights reserved.
//

import Foundation

let kNumberOfRun = 1000000
let kWinRate = 76/147.0
let kRare4CopyRate = 0.2
let kERWPerPack = 1/7.5 + 7/8.0 * (1/24.0 + 23/24.0 * 0.2) + (2 * 3 + 5) * 0.002
let kERWPerDraftDeck = 2 * (1-kRare4CopyRate) * 0.2 + (10 * 3 + 33) * 0.002
let kERWPerSealedDeck = 6 * 7/8.0 * (1-kRare4CopyRate) * 0.2 + (18 * 3 + 66) * 0.002
let kERWPerICR = 0.9 * 0.006 + 0.1 * 7/8.0 * (1-kRare4CopyRate) * 0.2

print("MTGA Reward Sim")
print("Ranked Draft:")

var totalGems = 0, totalPacks = 0

for _ in 1...kNumberOfRun {
	var currentWins = 0, currentLoss = 0
	while currentLoss < 3 && currentWins < 7 {
		if Double.random(in: 0...1) < kWinRate {
			currentWins += 1
		}
		else {
			currentLoss += 1
		}
	}
	switch currentWins
	{
	case 0:
		totalGems += 50
		totalPacks = totalPacks + 1.2
	case 1:
		totalGems += 100
		totalPacks = totalPacks + 1.22
	case 2:
		totalGems += 200
		totalPacks = totalPacks + 1.24
	case 3:
		totalGems += 300
		totalPacks = totalPacks + 1.26
	case 4:
		totalGems += 450
		totalPacks = totalPacks + 1.30
	case 5:
		totalGems += 650
		totalPacks = totalPacks + 1.35
	case 6:
		totalGems += 850
		totalPacks = totalPacks + 1.40
	case 7:
		totalGems += 950
		totalPacks = totalPacks + 2
	default: break
	}

//	print("\(currentWins) wins!")
}

totalGems += kNumberOfRun * 2.0 * kRare4CopyRate * 20

var gemCostERW = Double(kNumberOfRun * 750 - totalGems) / (totalPacks * kERWPerPack + Double(kNumberOfRun) * kERWPerDraftDeck)
var goldCostERW = Double(kNumberOfRun) * 5000.0 / (totalPacks * kERWPerPack + Double(kNumberOfRun) * kERWPerDraftDeck + Double(totalGems) / gemCostERW)

print("""
	\(kNumberOfRun) runs:
	\(kWinRate) winRate
	\(kNumberOfRun * 5000) gold spent
	or \(kNumberOfRun * 750) gem spent
	\(totalGems) gem rewarded
	\(totalPacks) packs rewarded
	\(kNumberOfRun) draft decks rewarded
	\(gemCostERW) gem cost per rare wildcard
	\(goldCostERW) gold cost per rare wildcard
	ICR worths \(kERWPerICR * goldCostERW + 0.1 * 7/8.0 * kRare4CopyRate * 20 / gemCostERW * goldCostERW) gold or \(kERWPerICR * gemCostERW + 0.1 * 7/8.0 * kRare4CopyRate * 20) gem
	---------
	""")

print("MTGA Reward Sim")
print("Traditional Draft:")

totalGems = 0
totalPacks = 0

for _ in 1...kNumberOfRun {
	var currentWins = 0, currentLoss = 0
	while currentLoss < 2 && currentWins < 5 {
		if Double.random(in: 0...1) < kWinRate {
			currentWins += 1
		}
		else {
			currentLoss += 1
		}
	}
	switch currentWins
	{
	case 0:
		totalGems += 0
		totalPacks += 1
	case 1:
		totalGems += 0
		totalPacks += 2
	case 2:
		totalGems += 800
		totalPacks += 3
	case 3:
		totalGems += 1500
		totalPacks += 4
	case 4:
		totalGems += 1800
		totalPacks += 5
	case 5:
		totalGems += 2100
		totalPacks += 6
	default: break
	}
	
//	print("\(currentWins) wins!")
}

totalGems += kNumberOfRun * 2.0 * kRare4CopyRate * 20
gemCostERW = Double(kNumberOfRun * 1500 - totalGems) / (totalPacks * kERWPerPack + Double(kNumberOfRun) * kERWPerDraftDeck)

print("""
	\(kNumberOfRun) runs:
	\(kWinRate) winRate
	\(kNumberOfRun * 1500) gem spent
	\(totalGems) gem rewarded
	\(totalPacks) packs rewarded
	\(kNumberOfRun) draft decks rewarded
	\(kNumberOfRun * 1500 - totalGems) real gem spent
	\(gemCostERW) gem cost per rare wildcard
	----------
	""")

print("MTGA Reward Sim")
print("Sealed:")

totalGems = 0
totalPacks = 0

for _ in 1...kNumberOfRun {
	var currentWins = 0, currentLoss = 0
	while currentLoss < 3 && currentWins < 7 {
		if Double.random(in: 0...1) < kWinRate {
			currentWins += 1
		}
		else {
			currentLoss += 1
		}
	}
	switch currentWins
	{
	case 0:
		totalGems += 200
		totalPacks += 3
	case 1:
		totalGems += 400
		totalPacks += 3
	case 2:
		totalGems += 600
		totalPacks += 3
	case 3:
		totalGems += 1200
		totalPacks += 3
	case 4:
		totalGems += 1400
		totalPacks += 3
	case 5:
		totalGems += 1600
		totalPacks += 3
	case 6:
		totalGems += 2000
		totalPacks += 3
	case 7:
		totalGems += 2200
		totalPacks += 3
	default: break
	}
	
	//	print("\(currentWins) wins!")
}

totalGems += kNumberOfRun * 6.0 * kRare4CopyRate * 20
gemCostERW = Double(kNumberOfRun * 2000 - totalGems) / (totalPacks * kERWPerPack + Double(kNumberOfRun) * kERWPerSealedDeck)

print("""
	\(kNumberOfRun) runs:
	\(kWinRate) winRate
	\(kNumberOfRun * 2000) gem spent
	\(totalGems) gem rewarded
	\(totalPacks) packs rewarded
	\(kNumberOfRun * 6) draft decks rewarded
	\(kNumberOfRun * 2000 - totalGems) real gem spent
	\(gemCostERW) gem cost per rare wildcard
	ICR worths \(kERWPerICR * gemCostERW + 0.1 * 7/8.0 * kRare4CopyRate * 20) gem
	""")

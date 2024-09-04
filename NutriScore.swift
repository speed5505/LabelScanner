//
//  NutriScore.swift
//  Label Scanner
//
//  Created by Kabir Rajkotia on 9/4/24.
//

import Foundation

struct NutritionInfo {
    var calories: Double // kcal per 100g
    var totalFat: Double // grams per 100g
    var saturatedFat: Double // grams per 100g
    var sodium: Double // mg per 100g
    var totalSugars: Double // grams per 100g
    var fiber: Double // grams per 100g
    var protein: Double // grams per 100g
}

struct NutriScoreCalculator {

    static func calculateNutriScore(for nutrition: NutritionInfo) -> Int {
        let negativePoints = calculateNegativePoints(nutrition: nutrition)
        let positivePoints = calculatePositivePoints(nutrition: nutrition)
        
        return negativePoints - positivePoints
    }
    
    private static func calculateNegativePoints(nutrition: NutritionInfo) -> Int {
        var points = 0
        
        // Energy (calories) points
        switch nutrition.calories {
        case 335...670: points += 1
        case 670...1005: points += 2
        case 1005...1340: points += 3
        case 1340...1675: points += 4
        case 1675...: points += 5
        default: break
        }
        
        // Total Fat points
        switch nutrition.totalFat {
        case 3...20: points += 1
        case 20...30: points += 2
        case 30...40: points += 3
        case 40...: points += 4
        default: break
        }
        
        // Saturated Fat points
        switch nutrition.saturatedFat {
        case 1...2: points += 1
        case 2...3: points += 2
        case 3...4: points += 3
        case 4...: points += 4
        default: break
        }
        
        // Sodium points
        switch nutrition.sodium {
        case 90...180: points += 1
        case 180...270: points += 2
        case 270...360: points += 3
        case 360...450: points += 4
        case 450...: points += 5
        default: break
        }
        
        // Total Sugars points
        switch nutrition.totalSugars {
        case 4.5...9: points += 1
        case 9...13.5: points += 2
        case 13.5...18: points += 3
        case 18...: points += 4
        default: break
        }
        
        return points
    }
    
    private static func calculatePositivePoints(nutrition: NutritionInfo) -> Int {
        var points = 0
        
        // Fiber points
        switch nutrition.fiber {
        case 1.9...3.7: points += 1
        case 3.7...5.6: points += 2
        case 5.6...7.4: points += 3
        case 7.4...: points += 4
        default: break
        }
        
        // Protein points
        switch nutrition.protein {
        case 1.6...3.2: points += 1
        case 3.2...4.8: points += 2
        case 4.8...6.4: points += 3
        case 6.4...8.0: points += 4
        case 8.0...: points += 5
        default: break
        }
        
        return points
    }
}



import asyncio
from os import name
import random

# This function will wait for a random time and then perform the calculation
async def perform_operations():
    # Generate a random delay between 2 and 6 seconds
    delay = random.randint(2, 6)
    print(f"Waiting for {delay} seconds...")
    
    # Simulate waiting with asyncio
    await asyncio.sleep(delay)
    
    # Define an array of numbers
    numbers = [3, 7, 10, 2, 5]
    
    # Pick a random number from the array
    random_num = random.choice(numbers)
    
    # Pick a random multiplier between 1 and 10
    multiplier = random.randint(1, 10)
    
    # Perform multiplication with the randomly selected number
    result = random_num * multiplier
    
    # Print out the number, multiplier, and result of multiplication
    print(f"Picked number: {random_num}, Multiplied by {multiplier} gives: {result}")
    
    # Sum of the numbers array + the result of the multiplication
    total_sum = sum(numbers) + result
    print(f"Sum of the array {numbers} plus the result is: {total_sum}")

# Main function to start the asyncio event loop
async def main():
    await perform_operations()

# This is the entry point to start the program
if name == 'main':
    asyncio.run(main())

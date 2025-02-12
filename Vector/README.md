### VectorUtils

**Author:** @nuliux

**Description:**

The `VectorUtils` module offers utility functions for performing various operations on 3D vectors in a game environment like Roblox. This module simplifies tasks such as calculating distances, directions, angles, and checking ranges and angles between points in 3D space, making it easier for developers to work with spatial relationships in their games.

**Key Functions and Methods:**

1. **VectorUtils.distance(pointA, pointB):**
   - Calculates the distance between two points in 3D space.
   - **Parameters:**
     - `pointA`: The first point as a `Vector3`.
     - `pointB`: The second point as a `Vector3`.
   - **Returns:** The distance as a number.

2. **VectorUtils.direction(fromPoint, toPoint):**
   - Calculates the direction from one point to another.
   - **Parameters:**
     - `fromPoint`: The starting point as a `Vector3`.
     - `toPoint`: The target point as a `Vector3`.
   - **Returns:** A normalized `Vector3` representing the direction.

3. **VectorUtils.angleBetween(vec1, vec2):**
   - Calculates the angle between two vectors in degrees.
   - **Parameters:**
     - `vec1`: The first vector as a `Vector3`.
     - `vec2`: The second vector as a `Vector3`.
   - **Returns:** The angle in degrees as a number.

4. **VectorUtils.isInRange(pointA, pointB, range):**
   - Checks if `pointA` is within a certain range of `pointB`.
   - **Parameters:**
     - `pointA`: The first point as a `Vector3`.
     - `pointB`: The second point as a `Vector3`.
     - `range`: The maximum distance as a number.
   - **Returns:** `true` if `pointA` is within the specified range of `pointB`, otherwise `false`.

5. **VectorUtils.isInAngle(fromPoint, toPoint, maxAngle):**
   - Checks if the direction from `fromPoint` to `toPoint` is within a specified angle.
   - **Parameters:**
     - `fromPoint`: The starting point as a `Vector3`.
     - `toPoint`: The target point as a `Vector3`.
     - `maxAngle`: The maximum angle in degrees as a number.
   - **Returns:** `true` if the angle is within the specified limit, otherwise `false`.

**Usage:**

The `VectorUtils` module is useful in scenarios where spatial calculations are necessary. It can be used in games for features such as:

- **Distance Calculations:** Determining how far apart two objects are.
- **Directional Movement:** Calculating movement directions for characters or objects.
- **Angle-Based Logic:** Implementing features that depend on angles, such as field of view or targeting systems.
- **Range Checks:** Verifying if objects are within a certain distance for interactions or effects.
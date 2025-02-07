### RaycastingUtils

**Author:** @TheMostWSpinUser

**Description:**

The `RaycastingUtils` module offers utility functions for performing raycasting operations in a 3D environment, such as in a game engine like Roblox. Raycasting is a technique used to detect intersections between a ray (defined by an origin and direction) and objects in the environment. This module simplifies the process of performing raycasts and checking for line-of-sight.

**Key Functions and Methods:**

1. **RaycastingUtils.new():**
   - Initializes a new `RaycastingUtils` object.

2. **RaycastingUtils:Raycast(origin, direction, maxLength, ignoreList):**
   - Performs a raycast from the specified `origin` in the given `direction` up to a maximum length (`maxLength`).
   - `ignoreList` is an optional parameter that specifies a list of objects to ignore during the raycast.
   - Returns the result of the raycast, which includes information about the hit object, position, and normal if an intersection is detected.

3. **RaycastingUtils:LineOfSight(origin, target, ignoreList):**
   - Checks if there is a clear line of sight between the `origin` and `target` positions.
   - `ignoreList` is an optional parameter that specifies a list of objects to ignore during the line-of-sight check.
   - Returns `true` if there is no obstruction between the origin and target, and `false` otherwise.

**Usage:**

The `RaycastingUtils` module is useful in scenarios where detecting obstructions or interactions between objects is necessary. It can be used in games for features such as:

- **Targeting Systems:** Determining if a target is visible or obstructed.
- **Collision Detection:** Checking for collisions with the environment or other objects.
- **AI and Pathfinding:** Helping AI agents navigate by detecting obstacles in their path.

**Raycasting Parameters:**

The module uses `RaycastParams` to configure the raycasting operation, allowing for customization of filtering and distance. The `FilterDescendantsInstances` property is used to specify objects to ignore, ensuring that the raycast only considers relevant objects.

---

This description provides an overview of the `RaycastingUtils` module, highlighting its key features and benefits for developers working with raycasting operations in a 3D environment.
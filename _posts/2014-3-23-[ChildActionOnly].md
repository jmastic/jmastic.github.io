---
layout: post
title: \[ChildActionOnly\]
---

While building out a new feature I found a need to call an action from a controller but didn’t want that action accessible by a user request.

Enter [ChildActionOnly].

By adding [ChildActionOnly] to the controller method I could be assured that the RenderAction I was using to call the method would be able to access the method, but it would not callable by a user request.

You can read more about the ChildActionOnly MVC attribute at the Microsoft Developer Network.

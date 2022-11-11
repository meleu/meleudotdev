---
dg-publish: true
---
# Fundamentals of TDD - upcase

- <https://thoughtbot.com/upcase/fundamentals-of-tdd>

## Fundamentals of TDD - Overview


## Red-Green-Refactor by Example


## Telling a Story with Your Tests

- <https://thoughtbot.com/upcase/videos/telling-a-story-with-your-tests>

In this lesson it was mentioned that the test code should "tell a story", so it can work as documentation. Therefore, trying to DRY in test code can be a bad-practice.

> DRY is a good principle to follow in code, but it's a means to an end, not the end itself. Often in tests, overly-aggressive de-duplication can lower the quality of test code, as it loses its explanatory capability.

According to this article from thoughtbot, it's better to favor Ruby methods over RSpec's DSL constructs. Example:

```ruby
describe "#promote_to_admin" do
  it "makes a regular membership an admin membership" do
    membership_to_promote = build_non_admin_membership

    membership_to_promote.promote_to_admin

    expect(membership_to_promote).to be_admin
  end

  it "doesn't change other memberships" do
    membership_to_promote = build_non_admin_membership
    membership_to_not_promote = build_non_admin_membership

    membership_to_promote.promote_to_admin

    expect(membership_to_not_promote).not_to be_admin
  end

  def build_non_admin_membership
    user = User.new
    group = Group.new("A group")

    Membership.new(user: user, group: group, admin: false)
  end
end
```

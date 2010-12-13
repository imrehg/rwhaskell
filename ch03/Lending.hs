-- file: ch03/Lending.hs
-- Changed the behaviour slightly, the reserve is now a percentage
-- of the total balance to keep in reserve
lend2 amount balance = if amount < balance * (1 - reserve)
                       then Just newBalance
                       else Nothing
                         where reserve = 0.1
                               newBalance = balance - amount
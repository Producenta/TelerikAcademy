﻿namespace Bank
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;


    public interface IDepositable
    {
        void Deposit(decimal amount);
    }
}

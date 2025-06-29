﻿using HomologacaoBalanca.Services.Error;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomologacaoBalanca.Utilities
{
    internal static class TaskUtilities
    {
        public static async void FireAndForgetSafeAsync(this Task task, IErrorHandler? handler = null)
        {
            try
            {
                await task;
            }
            catch (Exception ex)
            {
                handler?.HandleError(ex);
            }
        }
    }
}

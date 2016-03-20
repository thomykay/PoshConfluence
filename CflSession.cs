namespace ThomyKay.Confluence
{
    using System;
    using System.Collections.Generic;
    using System.Text;

    /// <summary>
    /// Holds the information about a single session.
    /// </summary>
    public class CflSession
    {
        private string token;

        private object proxy;

        private string connectionUri;

        /// <summary>
        /// Gets or sets the proxy.
        /// </summary>
        /// <value>The proxy.</value>
        public object Proxy
        {
            get
            {
                return proxy;
            }
            set
            {
                proxy = value;
            }
        }

        public string Token
        {
            get
            {
                return token;
            }
            set
            {
                token = value;
            }
        }
        public string ConnectionUri
        {
            get
            {
                return connectionUri;
            }
            set
            {
                connectionUri = value;
            }
        }
    }
}

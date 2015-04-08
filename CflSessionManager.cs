namespace ThomyKay.Confluence
{
  using System;
  using System.Collections.Generic;
  using System.Text;

  /// <summary>
  /// Holds a list of sessions.
  /// </summary>
  public class CflSessionManager
  {
    private List<CflSession> sessions = new List<CflSession>();
    private CflSession currentSession;

    /// <summary>
    /// Gets or sets the sessions.
    /// </summary>
    /// <value>The sessions.</value>
    public List<CflSession> Sessions
    {
      get { return sessions; }
    }

    /// <summary>
    /// Gets or sets the current session.
    /// </summary>
    /// <value>The current session.</value>
    public CflSession CurrentSession
    {
      get
      {
        return currentSession;
      }
      set
      {
        currentSession = value;
      }
    }

    public CflSession Enter(CflSession session)
    {
      if (!this.Sessions.Contains(session))
      {
        this.Sessions.Add(session);
      }

      this.CurrentSession = session;

      return session;
    }

    public void Remove(CflSession session)
    {
      if (this.Sessions.Contains(session))
      {
        this.Sessions.Remove(session);
      }

      if (this.CurrentSession == session)
      {
        this.CurrentSession = null;
      }
    }
  }
}

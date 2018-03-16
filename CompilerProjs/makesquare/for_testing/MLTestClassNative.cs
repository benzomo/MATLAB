/*
* MATLAB Compiler: 6.4 (R2017a)
* Date: Wed Sep 06 12:21:54 2017
* Arguments:
* "-B""macro_default""-W""dotnet:makesquare,MLTestClass,4.0,private""-T""link:lib""-d""C:\
* Users\benmo\OneDrive\MATLAB\CompilerProjs\makesquare\for_testing""-v""class{MLTestClass:
* D:\Program
* Files\MATLAB\R2017a\toolbox\dotnetbuilder\Examples\VS12\NET\MagicSquareExample\MagicSqua
* reComp\makesquare.m}"
*/
using System;
using System.Reflection;
using System.IO;
using MathWorks.MATLAB.NET.Arrays;
using MathWorks.MATLAB.NET.Utility;

#if SHARED
[assembly: System.Reflection.AssemblyKeyFile(@"")]
#endif

namespace makesquareNative
{

  /// <summary>
  /// The MLTestClass class provides a CLS compliant, Object (native) interface to the
  /// MATLAB functions contained in the files:
  /// <newpara></newpara>
  /// D:\Program
  /// Files\MATLAB\R2017a\toolbox\dotnetbuilder\Examples\VS12\NET\MagicSquareExample\Magic
  /// SquareComp\makesquare.m
  /// </summary>
  /// <remarks>
  /// @Version 4.0
  /// </remarks>
  public class MLTestClass : IDisposable
  {
    #region Constructors

    /// <summary internal= "true">
    /// The static constructor instantiates and initializes the MATLAB Runtime instance.
    /// </summary>
    static MLTestClass()
    {
      if (MWMCR.MCRAppInitialized)
      {
        try
        {
          Assembly assembly= Assembly.GetExecutingAssembly();

          string ctfFilePath= assembly.Location;

          int lastDelimiter= ctfFilePath.LastIndexOf(@"\");

          ctfFilePath= ctfFilePath.Remove(lastDelimiter, (ctfFilePath.Length - lastDelimiter));

          string ctfFileName = "makesquare.ctf";

          Stream embeddedCtfStream = null;

          String[] resourceStrings = assembly.GetManifestResourceNames();

          foreach (String name in resourceStrings)
          {
            if (name.Contains(ctfFileName))
            {
              embeddedCtfStream = assembly.GetManifestResourceStream(name);
              break;
            }
          }
          mcr= new MWMCR("",
                         ctfFilePath, embeddedCtfStream, true);
        }
        catch(Exception ex)
        {
          ex_ = new Exception("MWArray assembly failed to be initialized", ex);
        }
      }
      else
      {
        ex_ = new ApplicationException("MWArray assembly could not be initialized");
      }
    }


    /// <summary>
    /// Constructs a new instance of the MLTestClass class.
    /// </summary>
    public MLTestClass()
    {
      if(ex_ != null)
      {
        throw ex_;
      }
    }


    #endregion Constructors

    #region Finalize

    /// <summary internal= "true">
    /// Class destructor called by the CLR garbage collector.
    /// </summary>
    ~MLTestClass()
    {
      Dispose(false);
    }


    /// <summary>
    /// Frees the native resources associated with this object
    /// </summary>
    public void Dispose()
    {
      Dispose(true);

      GC.SuppressFinalize(this);
    }


    /// <summary internal= "true">
    /// Internal dispose function
    /// </summary>
    protected virtual void Dispose(bool disposing)
    {
      if (!disposed)
      {
        disposed= true;

        if (disposing)
        {
          // Free managed resources;
        }

        // Free native resources
      }
    }


    #endregion Finalize

    #region Methods

    /// <summary>
    /// Provides a single output, 0-input Objectinterface to the makesquare MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// MAKESQUARE Magic square of size x.
    /// Y = MAKESQUARE(X) returns a magic square of size x.
    /// This file is used as an example for the MATLAB 
    /// .NET Assembly product.
    /// </remarks>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object makesquare()
    {
      return mcr.EvaluateFunction("makesquare", new Object[]{});
    }


    /// <summary>
    /// Provides a single output, 1-input Objectinterface to the makesquare MATLAB
    /// function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// MAKESQUARE Magic square of size x.
    /// Y = MAKESQUARE(X) returns a magic square of size x.
    /// This file is used as an example for the MATLAB 
    /// .NET Assembly product.
    /// </remarks>
    /// <param name="x">Input argument #1</param>
    /// <returns>An Object containing the first output argument.</returns>
    ///
    public Object makesquare(Object x)
    {
      return mcr.EvaluateFunction("makesquare", x);
    }


    /// <summary>
    /// Provides the standard 0-input Object interface to the makesquare MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// MAKESQUARE Magic square of size x.
    /// Y = MAKESQUARE(X) returns a magic square of size x.
    /// This file is used as an example for the MATLAB 
    /// .NET Assembly product.
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] makesquare(int numArgsOut)
    {
      return mcr.EvaluateFunction(numArgsOut, "makesquare", new Object[]{});
    }


    /// <summary>
    /// Provides the standard 1-input Object interface to the makesquare MATLAB function.
    /// </summary>
    /// <remarks>
    /// M-Documentation:
    /// MAKESQUARE Magic square of size x.
    /// Y = MAKESQUARE(X) returns a magic square of size x.
    /// This file is used as an example for the MATLAB 
    /// .NET Assembly product.
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return.</param>
    /// <param name="x">Input argument #1</param>
    /// <returns>An Array of length "numArgsOut" containing the output
    /// arguments.</returns>
    ///
    public Object[] makesquare(int numArgsOut, Object x)
    {
      return mcr.EvaluateFunction(numArgsOut, "makesquare", x);
    }


    /// <summary>
    /// Provides an interface for the makesquare function in which the input and output
    /// arguments are specified as an array of Objects.
    /// </summary>
    /// <remarks>
    /// This method will allocate and return by reference the output argument
    /// array.<newpara></newpara>
    /// M-Documentation:
    /// MAKESQUARE Magic square of size x.
    /// Y = MAKESQUARE(X) returns a magic square of size x.
    /// This file is used as an example for the MATLAB 
    /// .NET Assembly product.
    /// </remarks>
    /// <param name="numArgsOut">The number of output arguments to return</param>
    /// <param name= "argsOut">Array of Object output arguments</param>
    /// <param name= "argsIn">Array of Object input arguments</param>
    /// <param name= "varArgsIn">Array of Object representing variable input
    /// arguments</param>
    ///
    [MATLABSignature("makesquare", 1, 1, 0)]
    protected void makesquare(int numArgsOut, ref Object[] argsOut, Object[] argsIn, params Object[] varArgsIn)
    {
        mcr.EvaluateFunctionForTypeSafeCall("makesquare", numArgsOut, ref argsOut, argsIn, varArgsIn);
    }

    /// <summary>
    /// This method will cause a MATLAB figure window to behave as a modal dialog box.
    /// The method will not return until all the figure windows associated with this
    /// component have been closed.
    /// </summary>
    /// <remarks>
    /// An application should only call this method when required to keep the
    /// MATLAB figure window from disappearing.  Other techniques, such as calling
    /// Console.ReadLine() from the application should be considered where
    /// possible.</remarks>
    ///
    public void WaitForFiguresToDie()
    {
      mcr.WaitForFiguresToDie();
    }



    #endregion Methods

    #region Class Members

    private static MWMCR mcr= null;

    private static Exception ex_= null;

    private bool disposed= false;

    #endregion Class Members
  }
}

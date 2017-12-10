using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for OleDbHelper
/// </summary>
public class SQLHelper
{
    private static SqlConnection _dbConnection;

    public static void Open()
    {
        try
        {
            if (null == _dbConnection)
            {
                string temp = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
                _dbConnection = new SqlConnection(temp);
            }
            if (_dbConnection.State == System.Data.ConnectionState.Closed)
                _dbConnection.Open();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Trace.WriteLine(ex.Message, "SQLHelper.Open");
        }
    }

    public static void Close()
    {
        if (_dbConnection.State == System.Data.ConnectionState.Open)
            _dbConnection.Close();
    }


    public static DataTable ExecuteDataTable(string storedProc, SqlParameter[] _params)
    {
        SqlDataAdapter _dataAdapter = new SqlDataAdapter(storedProc, _dbConnection);
        //_dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
        if (_params != null)
        {
            foreach (SqlParameter _sqlPa in _params)
            {
                _dataAdapter.SelectCommand.Parameters.Add(_sqlPa);
            }
        }

        DataTable _tb = new DataTable();
        try
        {
            Open();
            _dataAdapter.SelectCommand.Connection = _dbConnection;

            _dataAdapter.Fill(_tb);
        }
        catch (Exception ex)
        {
            System.Diagnostics.Trace.WriteLine(ex.Message, "SQLHelper.executeDataTable");
        }
        finally
        {
            _dataAdapter.Dispose();
            Close();

        }
        return _tb;
    }

    public static ArrayList ExecuteReader(string storedProc, SqlParameter[] _params)
    {
        SqlCommand _sqlCmd = new SqlCommand(storedProc, _dbConnection);
        //_sqlCmd.CommandType = CommandType.StoredProcedure;
        if (_params != null)
        {
            foreach (SqlParameter _sqlPa in _params)
            {
                _sqlCmd.Parameters.Add(_sqlPa);
            }
        }

        ArrayList _al = new ArrayList();
        try
        {
            Open();
            _sqlCmd.Connection = _dbConnection;


           
            SqlDataReader _dr = _sqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (_dr.HasRows)
            {
                _dr.Read();
                
                for (int i = 0; (i < _dr.FieldCount); i++)
                {
                    _al.Add(_dr[i]);
                }
                return _al;
            }
          



        }
        catch (Exception ex)
        {
            System.Diagnostics.Trace.WriteLine(ex.Message, "SQLHelper.executeReader");
        }
        finally
        {
            _sqlCmd.Dispose();
            Close();
        }
        return _al;
    }

    public static bool ExecuteNonQuery(string storedProc, SqlParameter[] _params)
    {
        SqlCommand cmd = new SqlCommand(storedProc, _dbConnection);
        //cmd.CommandType=CommandType.StoredProcedure;
        if (_params != null)
        {
            foreach (SqlParameter _sqlPa in _params) cmd.Parameters.Add(_sqlPa);
        }

        try
        {
            Open();
            cmd.Connection = _dbConnection;

            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Trace.WriteLine(ex.Message, "SQLHelper.executeNonQuery");
            return false;
        }
        finally
        {
            cmd.Dispose();
            Close();
        }

        return true;
    }

    public static object ExecuteScalar(string storedProc, SqlParameter[] _params)
     {
        object ret;
        SqlCommand cmd = new SqlCommand(storedProc, _dbConnection);
        //cmd.CommandType=CommandType.Text;
        if (_params != null)
        {
            foreach (SqlParameter _sqlPa in _params) cmd.Parameters.Add(_sqlPa);
        }

        try
        {
            Open();
            cmd.Connection = _dbConnection;

            ret = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Trace.WriteLine(ex.Message, "SQLHelper.executeScalar");
            ret = null;
        }
        finally
        {
            cmd.Dispose();
            Close();
        }
        return ret;
    }

    public static SqlParameter CreateParam(string nome, SqlDbType tipo, object valor)
    {
        SqlParameter param = new SqlParameter();
        param.ParameterName = nome;
        param.SqlDbType = tipo;
        param.Value = valor;

        return param;
    }

    public static SqlParameter CreateParam(string nome, object valor)
    {
        SqlParameter param = new SqlParameter();
        param.ParameterName = nome;
        param.Value = valor;

        return param;
    }

}

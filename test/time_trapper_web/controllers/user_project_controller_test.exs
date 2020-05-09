defmodule TimeTrapperWeb.UserProjectControllerTest do
  use TimeTrapperWeb.ConnCase

  alias TimeTrapper.Entities

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:user_project) do
    {:ok, user_project} = Entities.create_user_project(@create_attrs)
    user_project
  end

  describe "index" do
    test "lists all user_projects", %{conn: conn} do
      conn = get(conn, Routes.user_project_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing User projects"
    end
  end

  describe "new user_project" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_project_path(conn, :new))
      assert html_response(conn, 200) =~ "New User project"
    end
  end

  describe "create user_project" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_project_path(conn, :create), user_project: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.user_project_path(conn, :show, id)

      conn = get(conn, Routes.user_project_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show User project"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_project_path(conn, :create), user_project: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User project"
    end
  end

  describe "edit user_project" do
    setup [:create_user_project]

    test "renders form for editing chosen user_project", %{conn: conn, user_project: user_project} do
      conn = get(conn, Routes.user_project_path(conn, :edit, user_project))
      assert html_response(conn, 200) =~ "Edit User project"
    end
  end

  describe "update user_project" do
    setup [:create_user_project]

    test "redirects when data is valid", %{conn: conn, user_project: user_project} do
      conn = put(conn, Routes.user_project_path(conn, :update, user_project), user_project: @update_attrs)
      assert redirected_to(conn) == Routes.user_project_path(conn, :show, user_project)

      conn = get(conn, Routes.user_project_path(conn, :show, user_project))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, user_project: user_project} do
      conn = put(conn, Routes.user_project_path(conn, :update, user_project), user_project: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User project"
    end
  end

  describe "delete user_project" do
    setup [:create_user_project]

    test "deletes chosen user_project", %{conn: conn, user_project: user_project} do
      conn = delete(conn, Routes.user_project_path(conn, :delete, user_project))
      assert redirected_to(conn) == Routes.user_project_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.user_project_path(conn, :show, user_project))
      end
    end
  end

  defp create_user_project(_) do
    user_project = fixture(:user_project)
    {:ok, user_project: user_project}
  end
end
